module UsersHelper
  def profile_image_for(user)
    img_src = "http://secure.gravatar.com/avatar/#{user.gravatar_id}"
    image_tag(img_src, alt: user.username)
  end
end
