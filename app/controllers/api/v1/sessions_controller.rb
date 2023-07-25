class Api::V1::SessionsController < Api::V1::BaseController
  skip_before_action :verify_request, only: [:login]

  def login
    user_info = find_user
    user = user_info[:user]
    token = jwt_encode(user_id: user.id) # put user_id in payload
    render json: {
      headers: { "X-USER-TOKEN" => token },
      user: user,
      new_user: user_info[:new_user]
    }
  end

  private

  def fetch_wx_open_id(code) # retrieve open id
    app_id = Rails.application.credentials.dig(:wechat, :app_id)
    app_secret = Rails.application.credentials.dig(:wechat, :app_secret)
    url = "https://api.weixin.qq.com/sns/jscode2session?appid=#{app_id}&secret=#{app_secret}&js_code=#{code}&grant_type=authorization_code"
    response = RestClient.get(url)
    puts "response #{response}"
    JSON.parse(response.body)
  end

  def find_user # find or create user
    open_id = fetch_wx_open_id(params[:code])["openid"]
    if user = User.find_by(open_id: open_id)
      new_user = false
    else
      user = User.create(open_id: open_id)
      new_user = true
    end
    user_info = {
      user: user,
      new_user: new_user
    }
  end

  def jwt_encode(payload) # generate JWT
    JWT.encode payload, HMAC_SECRET, 'HS256'
  end
end
