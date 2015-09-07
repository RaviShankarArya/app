module Api
  module V1
    class UsersController < SecureController
      def index
        users=User.all
        render :status => 200, :json => users
      end
    end
  end
end