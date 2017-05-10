class UsersController < ApplicationController
        def edit
          if current_user
            @user = current_user
            @nav_company = Company.find_by id: current_user.company_id
            @companies = Company.all
          end
        end
        def update
          @user = User.find_by name: current_user.name
          @user.update(user_params)
          redirect_to '/'
        end
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
                params.require(:user).permit(:name, :email, :password, :company_id)
          end
end
