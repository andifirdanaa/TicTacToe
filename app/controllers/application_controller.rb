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

	def check_session_fe
		if session['mdm_members_sess'].present?
			if session['mdm_members_sess']['exp'] < Time.now.to_i 
				reset_session
			end
		end
	rescue Exception => ex
		redirect_to ''
	end

	def get_token
		@@username_bo = params['userName']

		url = ENV['CIRACAS_WEB']+"authentication/login"
		data = {
			username: params['userName'],
			password: params['password']
		}
		res = HTTParty.post(
			url, 
			:body => data,
			:headers => { 
				# 'Content-Type' => 'application/json'
			}
		)
		return res
	end

	def get_moduls
		url = "akses_modul/get_by_role_id?user_role_id=#{session['sess']['role_id']}"
		@list = ApplicationHelper.req_get(url,session['sess']['my_token'])
	# 	 render json: url
    #   return
		return @list
	end

	def get_moduls_fe
		url_menu = ENV['CIRACAS_WEB']+"menu/listmenu"
		res_menu = HTTParty.get(url_menu)

		@data_menu = res_menu.parsed_response

		if @data_menu['status']

			@menu = @data_menu['content']
			
			if @menu.present?
				@menu_child = @menu['menu_child']

				if @menu_child.present?
					@sub_menu = @menu_child['menu']
				else
					@sub_menu = nil
				end
			else
				@menu_detail = nil
			end
		else
			@menu_detail = nil
		end


		rescue Exception => ex
			Rails.logger.info "========> Gangguan: #{ex}"
	end

	def get_sys_fe

		url_system = ENV['CIRACAS_WEB']+"system_setting/list"
		res_system = HTTParty.get(url_system)
		@data_system = res_system.parsed_response

		if @data_system['content'].present?
			@data_system['content']['data'].each do |val|
				if val['sys_key'] == 'Instagram'
					@instagram = val['sys_val'] rescue ''
				elsif val['sys_key'] == 'Facebook'
					@facebook = val['sys_val'] rescue ''
				elsif val['sys_key'] == 'Email'
					@email = val['sys_val'] rescue ''
				elsif val['sys_key'] == 'Facebook-logo'
					@facebooklogo = val['sys_val'] rescue ''
				elsif val['sys_key'] == 'Instagram-logo'
					@instagramlogo = val['sys_val'] rescue ''
				elsif val['sys_key'] == 'Whatsaap-logo'
					@whatsapplogo = val['sys_val'] rescue ''
				elsif val['sys_key'] == 'Gmail'
					@gmail = val['sys_val'] rescue ''
				elsif val['sys_key'] == 'Visi'
					@visi = val['sys_val'] rescue ''
				elsif val['sys_key'] == 'Misi-1'
					@misi1 = val['sys_val'] rescue ''
				elsif val['sys_key'] == 'Misi-2'
					@misi2 = val['sys_val'] rescue ''
				elsif val['sys_key'] == 'Misi-3'
					@misi3 = val['sys_val'] rescue ''
				elsif val['sys_key'] == 'Misi-4'
					@misi4 = val['sys_val'] rescue ''
				elsif val['sys_key'] == 'Misi-5'
					@misi5 = val['sys_val'] rescue ''
				elsif val['sys_key'] == 'Tentang-rsud-ciracas'
					@Tentangrsud = val['sys_val'] rescue ''
				end
			end
		end
		# render json: @data_system
		# return
	end
		
	
end