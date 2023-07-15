json.extract! @user, :id, :username, :age, :weight, :height, :gender, :target
json.badges @user.badges do |badge|
  json.extract! badge, :badge_img, :name, :description
end
