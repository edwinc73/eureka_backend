json.extract! @user, :id, :username, :age, :weight, :height, :gender
json.badges @user.badges do |badge|
  json.extract! badge, :badge_img, :name
end
