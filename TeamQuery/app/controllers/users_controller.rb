class UsersController < ApplicationController
        def new
          @user = User.new
          @companies = Company.all
        end
        def create
                @user = User.new(user_params)
                if @user.save
                        session[:user_id] = @user_id
                        redirect_to '/'
                else
                        redirect_to '/user'
                end
        end
        private
          def user_params
                params.require(:user).permit(:name, :email, :password)
          end
end
