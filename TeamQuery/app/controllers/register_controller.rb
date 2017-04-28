class RegisterController < ApplicationController
	def register
	  @user = User.new
	end
	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user_id
			redirect_to '/'
		else
			redirect_to '/register'
		end
	end
	private
	  def user_params
		params.require(:user).permit(:name, :email, :password, :company)
	  end
end
