module ApplicationHelper
  def avatar_url1(user)
    "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png"
    	# 	gravatar_id = Digest::MD5::hexdigest(user.email).downcase
  #  "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identical&s=150"
  end

  # def avatar_url(user)
  #   user.avatar.attached?
  #   user.avatar.key
  # end
end
