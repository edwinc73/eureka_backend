class Api::V1::UsersController < Api::V1::BaseController
  def profile
    @user = @current_user
    render json: @user, serializer: UserSerializer
  end

  def update
    user = @current_user
    weight_watcher = "0"
    user.update(user_params)
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

end
