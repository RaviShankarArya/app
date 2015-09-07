class UserService
  def create(user_params)
    user = User.new(user_params)

    if user.valid?
      user.save
    end

    user
  end

  # def update_password_reset_fields(email)
  #   user = User.find_by(:email => email)
  #   user.update_attributes({ :reset_password_token => generate_auth_token(user), :reset_password_sent_at => Time.zone.now }) if user
  #   user
  # end

  private

  # def generate_auth_token(user)
  #   begin
  #     user.auth_token = SecureRandom.hex
  #   end while User.exists?(auth_token: user.auth_token)
  #   user.auth_token
  # end
end