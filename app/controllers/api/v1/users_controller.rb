class Api::V1::UsersController < Api::V1::BaseController
  def profile
    @user = @current_user
    render json: @user, serializer: UserSerializer
  end

  def fill_up_profile
    user = @current_user
    user.update(user_params)
    if user.save
      create_goal_for_new_user(user)
      render json: { msg: 'fill up profile and create a new goal' }
    else
      render_error
    end
  end

  def update
    user = @current_user
    weight_watcher = "0"
    user.update(weight_params)
    weight_watcher = weight_watcher(user)
    if user.save
      render json: {
        msg: 'user information changed',
        weight_watcher_and_badge_master: weight_watcher
      }
    else
      render_error
    end
  end

  def upload_avatar
    user = @current_user
    image = params[:avatar]
    user.avatar.attach(image)
    if user.save
      render json: { message: 'Image uploaded successfully' }
    else
      render json: { error: @current_user.errors.full_messages }, status: :unprocessable_entity
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :age, :weight, :height, :gender, :goal_weight)
  end

  def weight_params
    params.require(:user).permit(:weight, :goal_weight)
  end

  def render_error
    render json: { errors: @user.errors.full_messages },
    status: :unprocessable_entity
  end

  def weight_watcher(user)
    if user.badges.count { |x| x.name == "Weight Watcher" } == 0
      if user.weight == user.goal_weight
        badge = Badge.find_by(name: "Weight Watcher")
        Achievement.create(user: user, badge: badge)
        achieve = "1"
        achieve = badge_master(user)
        return achieve
      else
        return "0"
      end
    else
      return "0"
    end
  end

  def badge_master(user)
    if user.badges.count { |x| x.name == "Badge Master" } == 0
      if user.badges.count == 5
        badge = Badge.find_by(name: "Badge Master")
        Achievement.create(user: user, badge: badge)
        return "2"
      else
        return "1"
      end
    else
      return "1"
    end
  end

  def create_goal_for_new_user(user)
    bmr = calculate_bmr(user)
    user_target = user.goal_weight - user.weight
    goal = calculate_calorie_goal(bmr, user_target)
    Goal.create!(
      user: user,
      calorie_goal: goal[:calories],
      current_calorie: 0,
      fat_goal: goal[:fat],
      protein_goal: goal[:protein],
      carbs_goal: goal[:carbs],
      current_fat: 0,
      current_protein: 0,
      current_carbs: 0
    )
  end

  def calculate_bmr(user)
    if user.gender == 'm'
      bmr = 10 * user.weight + 6.25 * user.height - 5 * user.age + 5
    elsif user.gender == 'f'
      bmr = 10 * user.weight + 6.25 * user.height - 5 * user.age - 161
    end
    bmr.round
  end

  def calculate_calorie_goal(bmr, target)
    fat = (bmr * 0.3) / 9
    protein = (bmr * 0.2) / 4
    carbs = (bmr * 0.5) / 4
    calorie = bmr * 1.5
    if target <= 2 && target >= -2
      goal = {
        fat: fat.round(1),
        protein: protein.round(1),
        carbs: carbs.round(1),
        calories: calorie.round
      }
    elsif target > 2
      goal = {
        fat: (fat * 1.2).round(1),
        protein: (protein * 1.2).round(1),
        carbs: (carbs * 1.2).round(1),
        calories: (calorie * 1.2).round
      }
    else
      goal = {
        fat: (fat * 0.8).round(1),
        protein: (protein * 0.8).round(1),
        carbs: (carbs * 0.8).round(1),
        calories: (calorie * 0.8).round
      }
    end
    goal
  end


end
