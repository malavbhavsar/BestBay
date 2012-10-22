Recaptcha.configure do |config|
  config.public_key = Yetting.recaptcha_public_key
  config.private_key = Yetting.recaptcha_private_key
end