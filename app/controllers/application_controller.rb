class ApplicationController < ActionController::Base
	
	def check_session
		if !session['sess'].present?
			redirect_to '/backoffice'
			return
		else
			if Time.now.to_i > session['sess']['exp']
				reset_session
				redirect_to '/backoffice'
			end
		end
	end
		
	
end