class SecureController < ApplicationController
  before_action :check_for_session_expiry
  before_action :check_for_authoriztaion_token
  before_action :find_user

  private

  def check_for_session_expiry
    auth_token = find_user
    if auth_token.present?
      access_time = auth_token.access_time
      session_time = TimeDifference.between(access_time, Time.now).in_minutes
      if session_time >= 15
        auth_token.auth_token = SecureRandom.hex
      end
      auth_token.access_time = Time.now
      auth_token.save
    else
      render :json => {:message => ['your session has expired please login']}, :status => 403
    end
  end

  def check_for_authoriztaion_token
    render :status => 403, :nothing => true unless request.headers["Authorization"].present?
  end

  def find_user
   if request.headers["Authorization"].present?
     auth_token = AuthenticationToken.find_by(:auth_token => request.headers["Authorization"])
   end
 end
end