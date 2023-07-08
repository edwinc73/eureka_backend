class Api::V1::UsersController < Api::V1::BaseController
  def show
    # @user = @current_user
    @user = User.last
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
    params.require(:user).permit(:age, :weight, :height, :gender)
  end

  def render_error
    render json: { errors: @user.errors.full_messages },
    status: :unprocessable_entity
  end
end
