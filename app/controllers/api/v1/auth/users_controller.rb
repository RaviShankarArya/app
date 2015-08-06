module Api
  module V1
    module Auth
      class UsersController < ApplicationController
        def create
          user = UserService.new.create(user_params)
          if user.valid?
            render :json => {:user => data_to_send(user)}, :status => 201
          else
            render :json => {:errors => user.errors}, :status => 422
          end
        end

        private

        def user_params
          params.require(:user).permit(
              :first_name,
              :last_name,
              :email,
              :password,
              :password_confirmation,
              :phone
          )
        end

        def data_to_send(user)
          attributes_to_send = ["first_name", "last_name", "email", "phone", "auth_token"]
          user.attributes.select { |key| attributes_to_send.include?(key) }
        end
      end
    end
  end
end