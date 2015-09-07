module Api
  module V1
    module Auth
      class SessionsController < ApplicationController

        def create
          result = AuthenticationService.new.authenticate(session_params)
          if result.success?
            response = {:email => result.email, :auth_token => result.auth_token, :first_name => result.first_name, :last_name => result.last_name }
            render :status => 201, :json => response
          else
            render :status => 422, :json => { :errors => {:email => ['Invalid Email or Password']} }
          end
        end

        def sign_out
          user=User.find_by(:id => params[:id])
          if user.present?
           auth_token = user.authentication_token
           auth_token.delete
           render :status => 201, :json => {:message => ['signout']}
         else
          render :status => 422, :json => { :errors => {:message => ['you have to sign in first']} }
         end
       end

       private
       def session_params
        params.permit(:email, :password)
      end
    end
  end
end
end