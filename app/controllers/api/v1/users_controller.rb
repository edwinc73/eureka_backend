class Api::V1::UsersController < Api::V1::BaseController
  def profile
    # @user = @current_user
    @user = User.last
    render json: @user, serializer: UserSerializer
  end

  def update
    # @user = @current_user
    @user = User.last
    @user.update(user_params)
    if @user.save
      render json: { msg: 'user information changed' }
    else
      render_error
    end
    weight_watcher(@user)
  end

  private

  def user_params
    params.require(:user).permit(:age, :weight, :height, :gender, :goal_weight)
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
        badge_master(user)
      end
    end
  end

  def badge_master(user)
    if user.badges.count { |x| x.name == "Badge Master" } == 0
      if user.badges.count == 10
        badge = Badge.find_by(name: "Badge Master")
        Achievement.create(user: user, badge: badge)
      end
    end
  end

end
