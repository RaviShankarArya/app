class AuthenticationService
  def authenticate(params)
    user = User.find_by(:email => params[:email])
    if user.nil?
      Result.new(false, nil, nil, nil, nil)
    else
      user_authenticate(user,params[:password],params[:email])
    end
  end

  def user_authenticate(user, password, email)
    success = !!user.authenticate(password)
    email, auth_token, first_name, last_name = if success
      auth_token = generate_auth_token(user)
      [email, auth_token, user.first_name, user.last_name]
    end
    Result.new(success, email, first_name, last_name, auth_token)
  end

  class Result
    def initialize(success, email, first_name, last_name, auth_token)
      @success = success
      @email = email
      @auth_token = auth_token
      @first_name = first_name
      @last_name = last_name
    end

    attr_reader :email, :auth_token, :first_name, :last_name

    def success?
      @success
    end
  end

  private

  def generate_auth_token(user)
    auth_token = AuthenticationToken.new
    auth_token.auth_token = SecureRandom.hex
    auth_token.access_time = Time.now
    auth_token.user_id = user.id
    auth_token.save
    auth_token.auth_token
  end
end