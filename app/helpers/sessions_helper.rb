module SessionsHelper

	def sign_in(user)
		cookies.permanent[:email] = user.email.downcase
		self.current_user = user
	end

	def sign_out
		cookies.delete(:email)
		self.current_user = nil
	end

	def current_user
		email = cookies[:email]
		@current_user ||= User.find_by(email: email)
	end

	def current_user=(user)
		@current_user = user
	end

	def signed_in?
		!current_user.nil?
	end

	def current_user?(user)
		user == current_user
	end

	def signed_in_user
		unless signed_in?
			redirect_to signin_url, notice: 'Please sign in.'
		end
	end

end
