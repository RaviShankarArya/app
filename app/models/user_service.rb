class UserService
  def create(user_params)
    user = User.new(user_params)

    if user.valid?
      user.auth_token = generate_auth_token(user)
      user.save
    end

    user
  end

  private

  def generate_auth_token(user)
    begin
      user.auth_token = SecureRandom.hex
    end while User.exists?(auth_token: user.auth_token)
    user.auth_token
  end
end