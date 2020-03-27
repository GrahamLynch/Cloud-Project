class UserDecorator < BaseDecorator
  def info
    "Email Address:#{email}
    Clothing Preference:#{clothing_preference}
    Your admin status:#{admin}"
  end
end
