module Api
  module V1
    module Auth
      class PasswordResetsController < ApplicationController

        def create
          message = "You will receive an email with instructions about how to reset your password in a few minutes."
          render :json => { :message => message }
          # user = UserService.new.update_password_reset_fields(password_params[:email])
          # AuthenticationMailer.delay.send_password_reset_instructions(user.id) if user.present?
        end

        # def authorize_reset_password_token
        #   response_hash = {}
        #   response_hash = ResetPasswordTokenAuthorizer.new(params[:reset_password_token]).response
        #   render :json => response_hash, :status => 200
        # end

        # def update_password
        #   response_hash = {}
        #   response_hash = PasswordUpdater.new(params[:reset_password_token], params[:password], params[:password_confirmation]).response
        #   render :json => response_hash, :status => 200
        # end

        private

        def password_params
          params.permit(:email)
        end

      end
    end
  end
end
