Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['428678670498590'], ENV['ddf7d1bc1db6b617d15e95f11438431b'],
           :scope => 'name, picture, gender, locale, user_birthday, user_interests', :display => 'popup'
end