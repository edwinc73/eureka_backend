class Api::V1::SessionsController < Api::V1::BaseController
  skip_before_action :verify_request, only: [:login]

  def login
    user = find_user
    p "____________"
    p user
    token = jwt_encode(user_id: user.id) # put user_id in payload
    p token
    if user.username.present? &&
      user.age.present? &&
      user.weight.present? &&
      user.height.present? &&
      user.gender.present? &&
      user.goal_weight.present?
      new_user = false
    else
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
      new_user = true
    end
    render json: {
      headers: { "X-USER-TOKEN" => token },
      user: user,
      new_user: new_user
    }
  end

  private

  def fetch_wx_open_id(code) # retrieve open id
    app_id = Rails.application.credentials.dig(:wechat, :app_id)
    app_secret = Rails.application.credentials.dig(:wechat, :app_secret)
    p "-----------------------"
    p add_id
    p app_secret
    url = "https://api.weixin.qq.com/sns/jscode2session?appid=#{app_id}&secret=#{app_secret}&js_code=#{code}&grant_type=authorization_code"
    response = RestClient.get(url)
    p "-----------------------"
    puts "response #{response}"
    JSON.parse(response.body)
  end

  def find_user # find or create user
    open_id = fetch_wx_open_id(params[:code])["openid"]
    p "-----------------------"
    p open_id
    user = User.find_or_create_by(open_id: open_id)
    p user
  end

  def jwt_encode(payload) # generate JWT
    JWT.encode payload, HMAC_SECRET, 'HS256'
  end

  def calculate_bmr(user)
    bmr = 0
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
    if target <= 2 && target >= -2
      goal = {
        fat: fat.round(1),
        protein: protein.round(1),
        carbs: carbs.round(1),
        calories: bmr
      }
    elsif target > 2
      goal = {
        fat: (fat * 1.2).round(1),
        protein: (protein * 1.2).round(1),
        carbs: (carbs * 1.2).round(1),
        calories: (bmr * 1.2).round
      }
    else
      goal = {
        fat: (fat * 0.8).round(1),
        protein: (protein * 0.8).round(1),
        carbs: (carbs * 0.8).round(1),
        calories: (bmr * 0.8).round
      }
    end
    goal
  end

end
