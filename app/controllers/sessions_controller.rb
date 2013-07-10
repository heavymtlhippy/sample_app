class SessionsController < ApplicationController

	def new
	end


	def create  #when using the original form_for tag, the extra info (ie the creation of an object to store the signin info)
		#involved in creating it necessitates the saving the of the email and password in a "sessions" hash that is then stored in the 
		#params hash.  this is because form_for is primarily for resources (real things)  When using the more primitive
		#form_tag option, there are no "real things" being created so the info is automagically stored directly into the params hash
		
		user = User.find_by_email(params[:email].downcase)

			if user && user.authenticate(params[:password])
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
