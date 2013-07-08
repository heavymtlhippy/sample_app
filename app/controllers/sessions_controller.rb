class SessionsController < ApplicationController

	def new
	end


	def create
		user = User.find_by_email(params[:session][:email].downcase)

			if user && user.authenticate(params[:session][:password])
				#Sign in
				sign_in user
				redirect_to user
			else
				#error message and re-generate sign-in page
				flash.now[:error] = 'Sign in failed.  Invalid email/password combo' #mistaken entry
				render 'new'
			end
	end


	def destroy
		sign_out
		redirect_to root_url
		
	end

	
end
