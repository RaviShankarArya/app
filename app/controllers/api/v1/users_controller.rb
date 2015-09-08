module Api
  module V1
    class UsersController < SecureController
      def index
        users=User.where("user_status = ?",true)
        render :status => 200, :json => users
      end
    end
  end
end