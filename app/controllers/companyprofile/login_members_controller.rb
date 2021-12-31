class Companyprofile::LoginMembersController < ApplicationController
	skip_before_action :verify_authenticity_token
  	# layout "temp_login_bo"

	def login_member

		data = {
			email: params['email'],
			password: params['password']
		}
	  
		url = "authentication/loginfe"
		@login = ApplicationHelper.req_post(url,data,'')
	
		if @login['status']
			if @login['content']['status_aktif'] == 1
				mdm_members_sess = {
					email: @login['content']['email'],
					nama: @login['content']['nama'],
					exp: @login['content']['exp']
				}
			
				session['mdm_members_sess'] = mdm_members_sess
			end
		end

		render json: @login
		return
	end
end
