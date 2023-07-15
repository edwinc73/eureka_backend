class Api::V1::UsersController < Api::V1::BaseController
  def profile
    # @user = @current_user
    @user = User.last
    render json: @user, serializer: UserSerializer
  end

  def update
    # @user = @current_user
    @user = User.last
    if @user.update(user_params)
      render json: { msg: 'user information changed' }
    else
      render_error
    end
  end

  private

  def user_params
    params.require(:user).permit(:age, :weight, :height, :gender, :goal_weight)
  end

  def render_error
    render json: { errors: @user.errors.full_messages },
    status: :unprocessable_entity
  end
end
