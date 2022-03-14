class Companyprofile::HomeController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action  :get_moduls_fe, :get_sys_fe
	# before_action :get_sys
  
  	# layout "temp_login_bo"


	def mtm_home
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
				elsif val['sys_key'] == 'Telephone'
					@Telephone = val['sys_val'] rescue ''
				elsif val['sys_key'] == 'Whatsapp'
					@whatsapp = val['sys_val'] rescue ''
				elsif val['sys_key'] == 'Maps'
					@Maps = val['sys_val'] rescue ''
				end
			end
		end

		
		url_banner = ENV['CIRACAS_WEB']+"banners/list"
		res_banner = HTTParty.get(url_banner)
		@data_banner = res_banner.parsed_response
		@databanner = @data_banner['content']['data']
		

		url_jns = ENV['CIRACAS_WEB']+"jenis_rawat/list"
		res_jns = HTTParty.get(url_jns)
		@data_jns = res_jns.parsed_response
		@datajns = @data_jns['content']['data']

		url_why = ENV['CIRACAS_WEB']+"aset/list_by_flagging?flagging=why-choose"
		res_why = HTTParty.get(url_why)
		@data_why = res_why.parsed_response

		url_sam = ENV['CIRACAS_WEB']+"aset/list_by_flagging?flagging=sambutan-direktur"
		res_sam = HTTParty.get(url_sam)
		@data_sam = res_sam.parsed_response

		url_pel = ENV['CIRACAS_WEB']+"pelayanan/list"
		res_pel = HTTParty.get(url_pel)
		@data_pel = res_pel.parsed_response
		@datapelayanan = @data_pel['content']['data']

		url_dok = ENV['CIRACAS_WEB']+"dokter/list"
		res_dok = HTTParty.get(url_dok)
		@data_dok = res_dok.parsed_response
		@datadokter = @data_dok['content']['data']

		url_news = ENV['CIRACAS_WEB']+"news/list"
		res_news = HTTParty.get(url_news)
		@data_news = res_news.parsed_response
		@datanews = @data_news['content']['data']
	end

	def visimisi
		url_system = ENV['CIRACAS_WEB']+"system_setting/list"
		res_system = HTTParty.get(url_system)
		@data_system = res_system.parsed_response

		if @data_system['content'].present?
			@data_system['content']['data'].each do |val|
				if val['sys_key'] == 'Instagram'
					@instagram = val['sys_val'] rescue ''
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
				end
			end
		end

	end

	def struktur
		url_why = ENV['CIRACAS_WEB']+"aset/list_by_flagging?flagging=struktur-organisasi"
		res_why = HTTParty.get(url_why)
		@data_why = res_why.parsed_response
	end

	def profile

	end

	def pelayanan

		url_pel = ENV['CIRACAS_WEB']+"pelayanan/listfe?lantai=1"
		res_pel = HTTParty.get(url_pel)
		@data_pel = res_pel.parsed_response
		@datapel = @data_pel['content']['data'] rescue ''

		url_pel1 = ENV['CIRACAS_WEB']+"pelayanan/listfe?lantai=2"
		res_pel1 = HTTParty.get(url_pel1)
		@data_pel1 = res_pel1.parsed_response
		@datapel1 = @data_pel1['content']['data'] rescue ''

		url_pel2 = ENV['CIRACAS_WEB']+"pelayanan/listfe?lantai=3"
		res_pel2 = HTTParty.get(url_pel2)
		@data_pel2 = res_pel2.parsed_response
		@datapel2 = @data_pel2['content']['data'] rescue ''

		url_pel3 = ENV['CIRACAS_WEB']+"pelayanan/listfe?lantai=4"
		res_pel3 = HTTParty.get(url_pel3)
		@data_pel3 = res_pel3.parsed_response
		@datapel3 = @data_pel3['content']['data'] rescue ''

		url_jenis = ENV['CIRACAS_WEB']+"jenis_rawat"
		res_jenis = HTTParty.get(url_jenis)
		@data_jenis = res_jenis.parsed_response
		@datajenis = @data_jenis['content']['data'] rescue ''

		url_pel_jenis1 = ENV['CIRACAS_WEB']+"pelayanan/listjenis?jenis_rawat_id=1"
		res_pel_jenis1 = HTTParty.get(url_pel_jenis1)
		@data_pel_jenis1 = res_pel_jenis1.parsed_response
		@datapeljenis1 = @data_pel_jenis1['content']['data'] rescue ''

		url_pel_jenis2 = ENV['CIRACAS_WEB']+"pelayanan/listjenis?jenis_rawat_id=2"
		res_pel_jenis2 = HTTParty.get(url_pel_jenis2)
		@data_pel_jenis2 = res_pel_jenis2.parsed_response
		@datapeljenis2 = @data_pel_jenis2['content']['data'] rescue ''

		url_pel_jenis3 = ENV['CIRACAS_WEB']+"pelayanan/listjenis?jenis_rawat_id=3"
		res_pel_jenis3 = HTTParty.get(url_pel_jenis3)
		@data_pel_jenis3 = res_pel_jenis3.parsed_response
		@datapeljenis3 = @data_pel_jenis3['content']['data'] rescue ''

		url_pel_jenis4 = ENV['CIRACAS_WEB']+"pelayanan/listjenis?jenis_rawat_id=4"
		res_pel_jenis4 = HTTParty.get(url_pel_jenis4)
		@data_pel_jenis4 = res_pel_jenis4.parsed_response
		@datapeljenis4 = @data_pel_jenis4['content']['data'] rescue ''

		
		# render json: @datajenis
		# return
	end

	def pelayanan_get
		@_id = params[:id].present? ? params[:id] : 1
		url_pel_jenis1 = ENV['CIRACAS_WEB']+"pelayanan/listjenis?jenis_rawat_id=#{@_id}"
		res_pel_jenis1 = HTTParty.get(url_pel_jenis1)
		@data_pel_jenis1 = res_pel_jenis1.parsed_response
		@datapeljenis = @data_pel_jenis1['content']['data'] rescue ''
	end

	def pelayanan_detail
		@nama = params[:nama].present? ? params[:nama] : ''
		
		@namaa = @nama.split('-')
		@namasplit = @namaa[1]
		# render json: @namasplit 
		# return
		url_peldet = ENV['CIRACAS_WEB']+"pelayanan/detail/"+@namasplit
		res_peldet = HTTParty.get(url_peldet)
		@data_peldet = res_peldet.parsed_response
		@datapeldet = @data_peldet['content']

		if @datapeldet.present?
			@img_news = @datapeldet['image_url']
			@nama = @datapeldet['nama']
			@contents = @datapeldet['desc']
			@subdesc = @datapeldet['subdesc']
			@created_at = @datapeldet['created_at']
		else
			@datapeldet = ''
		end
		# render json: @datanewsdet
		# return
	end

	def layanan
		@_id = params['layanan'].present? ? params['layanan'] : 1

		@ids = @_id.split('-')

		url_pel_jenis1 = ENV['CIRACAS_WEB']+"pelayanan/listjenis?jenis_rawat_id=#{@ids[1]}"
		res_pel_jenis1 = HTTParty.get(url_pel_jenis1)
		@data_pel_jenis1 = res_pel_jenis1.parsed_response
		@datapeljenis = @data_pel_jenis1['content']['data'] rescue ''
		
		if @datapeljenis.present?
			@title_header = @datapeljenis[0]['jenis']
			
		else
			@datapeljenis = ''
		end
		
	end
	
	def layanan_rsud
		@_id = params['nama']

		@ids = @_id.split('-')

		url_layanan = ENV['CIRACAS_WEB']+"pelayanan/detail/#{@ids[1]}"
		res_layanan = HTTParty.get(url_layanan)
		@data_layanan = res_layanan.parsed_response
		@datalayanan = @data_layanan['content'] rescue ''
		
		if @datalayanan.present?
			@title_header = @datalayanan['jenis']
			
		else
			@datalayanan = ''
		end
	end

	def rawat_inap
		url_rawat_inap = ENV['CIRACAS_WEB']+"pelayanan/listjenis?jenis_rawat_id=1"
		res_rawat_inap = HTTParty.get(url_rawat_inap)
		@data_rawat_inap = res_rawat_inap.parsed_response
		@datarawatinap = @data_rawat_inap['content']['data'] rescue ''
		

		url_kamar = ENV['CIRACAS_WEB']+"pelayanan/rawat?keyword=Ruang-Isolasi"
		res_kamar = HTTParty.get(url_kamar)
		@data_kamar = res_kamar.parsed_response
		@datakamar = @data_kamar['content']['data'] rescue ''

		url_kamar_non = ENV['CIRACAS_WEB']+"pelayanan/rawat?keyword=Ruang-non-covid"
		res_kamar_non = HTTParty.get(url_kamar_non)
		@data_kamar_non = res_kamar_non.parsed_response
		@datakamarnon = @data_kamar_non['content']['data'] rescue ''

		if @datarawatinap.present?
			@title_header = @datarawatinap[0]['jenis']
		else
			@datarawatinap = ''
		end
	end

	def rawat_jalan
		url_rawat_jalan = ENV['CIRACAS_WEB']+"pelayanan/listjenis?jenis_rawat_id=2"
		res_rawat_jalan = HTTParty.get(url_rawat_jalan)
		@data_rawat_jalan = res_rawat_jalan.parsed_response
		@datarawatjalan = @data_rawat_jalan['content']['data'] rescue ''
		

		if @datarawatjalan.present?
			@title_header = @datarawatjalan[0]['jenis']
		else
			@datarawatjalan = ''
		end
	end

	def news
		
		@page = params[:page].present? ? params[:page].to_i : 1
		@keyword = params[:keyword].present? ? params[:keyword] : ''

		if @keyword.present?
			url = ENV['CIRACAS_WEB']+"news/listfe?keyword=#{@keyword}"
		else
			url = ENV['CIRACAS_WEB']+"news/listfe?page=#{@page}&keyword=#{@keyword}"
		end
		
		res_newsdet = HTTParty.get(url)
		@data = res_newsdet.parsed_response
		# @datanewsdet = @data_newsdet['content']
		# @data = ApplicationHelper.req_get(url,session['sess']['my_token'])
		# @datanews = HTTParty.get(url)
		# @data = @datanews.parsed_response
		# render json: @data
		# return
		@meta = @data['content']['meta'] rescue ""
	end

	def newsdetail
		@subtitle = params[:subtitle].present? ? params[:subtitle] : ''

		url_newsdet = ENV['CIRACAS_WEB']+"news/detail/"+@subtitle
		res_newsdet = HTTParty.get(url_newsdet)
		@data_newsdet = res_newsdet.parsed_response
		@datanewsdet = @data_newsdet['content']

		if @datanewsdet.present?
			@img_news = @datanewsdet['image_url']
			@title_news = @datanewsdet['title']
			@contents = @datanewsdet['desc']
			@created_at = @datanewsdet['created_at']
		else
			@datanewsdet = ''
		end
		# render json: @datanewsdet
		# return

	end

	def contact_us

		url_system = "system_setting"
		@data_system = ApplicationHelper.req_get(url_system,'')

		if @data_system['content'].present?
			@data_system['content']['data'].each do |val|
				if val['sys_key'] == 'Address'
					@address = val['sys_val'] rescue ''
					@address = @address.split(",")
				elsif val['sys_key'] == 'Phone'
					@phone = val['sys_val'] rescue ''
				elsif val['sys_key'] == 'Email'
					@email = val['sys_val'] rescue ''
				elsif val['sys_key'] == 'Maps'
					@maps = val['sys_val'] rescue ''
				end

			end
		end

	end

	def dokter
		
		url_spesialis = ENV['CIRACAS_WEB']+"/spesialis/listsp"
		res_spesialis = HTTParty.get(url_spesialis)
		@list_spesialis = res_spesialis.parsed_response
		@dataspesialis = @list_spesialis['content']['data']

		# render json: @dataspe1
		# return @dataspe1
		
		@pagese = params[:page].present? ? params[:page].to_i : 1
		@keywordes = params['keyword'].present? ? params['keyword'].to_i : ''
		# render json: @dataspe1
		# return @dataspe1
	end

	def dokter_

		@page = params[:page].present? ? params[:page].to_i : 1
		
		if params['id'] == '0'
			@keyword = ''
		else
			@keyword = params['id']
		end
		
		if @keyword.present?
			url_jadwal = ENV['CIRACAS_WEB']+"/dokter/jenis?keyword=#{@keyword}&page=#{@page}"
		else
			url_jadwal = ENV['CIRACAS_WEB']+"/dokter/jenis?page=#{@page}"
		end

		res_jadwal = HTTParty.get(url_jadwal)
		@list_jadwal = res_jadwal.parsed_response
		@datajadwal = @list_jadwal['content']
		# @datajadwalimage = @datajadwal[0]

		# render json:  @datajadwal
		# return

		# dokter = "redis_dokter"
		# get_cache_dokter = $redis.get(dokter)

		# if get_cache_dokter.present?
		# 	Rails.logger.info "\n\n### get_cache_ FROM REDIS \n #####\n\n"
		# 	# @datajadwal = JSON.parse get_cache_dokter
		# 	if params['id'] == 'semua'
		# 		@keyword = ''
		# 		@datajadwal = JSON.parse get_cache_dokter
		# 	else
		# 		@keyword = params['id']
		# 		@datajadwal = JSON.parse get_cache_dokter
		# 	end
		  
		# 	if @keyword.present?
		# 		$redis.del(get_cache_dokter)
		# 		url_jadwal = ENV['CIRACAS_WEB']+"/dokter/jenis?keyword=#{@keyword}&page=#{@page}"
		# 	else
		# 		url_jadwal = ENV['CIRACAS_WEB']+"/dokter/jenis?page=#{@page}"
		# 	end
	
		# 	res_jadwal = HTTParty.get(url_jadwal)
		# 	@list_jadwal = res_jadwal.parsed_response
		# 	@datajadwal = @list_jadwal['content']
		# else
		# 	@page = params[:page].present? ? params[:page].to_i : 1

		# 	if params['id'] == 'semua'
		# 		@keyword = ''
		# 	else
		# 		@keyword = params['id']
		# 	end
		  
		# 	if @keyword.present?
		# 		url_jadwal = ENV['CIRACAS_WEB']+"/dokter/jenis?keyword=#{@keyword}&page=#{@page}"
		# 	else
		# 		url_jadwal = ENV['CIRACAS_WEB']+"/dokter/jenis?page=#{@page}"
		# 	end
	
		# 	res_jadwal = HTTParty.get(url_jadwal)
		# 	@list_jadwal = res_jadwal.parsed_response
		# 	@datajadwal = @list_jadwal['content']

		# 	Rails.logger.info "\n\n####################### get_cache_system_setting FROM DB #######################\n\n"
		# 	$redis.setex(dokter, 120, @datajadwal.to_json) #set
	
		# end

		render json:  @datajadwal
		return

	end

	def jadwal_dokter_all
		@keyword = params['id']
	  
		if @keyword.present?
			url_jadwal = ENV['CIRACAS_WEB']+"/jadwal_praktek/list?keyword=#{@keyword}"
		else
			url_jadwal = ENV['CIRACAS_WEB']+"/jadwal_praktek/list"
		end

		res_jadwal = HTTParty.get(url_jadwal)
		@list_jadwal = res_jadwal.parsed_response
		@datajadwal = @list_jadwal['content']['data']
		@datajadwalimage = @datajadwal[0]

		render json:  @datajadwal
		return

  	end

	def jadwal_dokter_spe
		@page = params[:page].present? ? params[:page].to_i : 1
		
		if params['id'] == '0'
			@keyword = ''
		else
			@keyword = params['id']
		end

		if params['hari'] == ''
			@hari = ''
		else
			@hari = params['hari']
		end
		
		if @keyword.present?
			url_jdwl = ENV['CIRACAS_WEB']+"/dokter/jadwal?hari=#{@hari}&keyword=#{@keyword}&page=#{@page}"
		else
			url_jdwl = ENV['CIRACAS_WEB']+"/dokter/jadwal?page=#{@page}"
		end

		res_jdwl = HTTParty.get(url_jdwl)
		@list_jdwl = res_jdwl.parsed_response
		@datajdwl = @list_jdwl['content']

		render json:  @datajdwl
		return
	end

	def dokter_list
		@keyword = params['keyword'].present? ? params['keyword'] : ''
	
		if @keyword.present?
			url_spesialis = ENV['CIRACAS_WEB']+"/dokter/listdok?keyword=#{@keyword}"
		else
			url_spesialis = ENV['CIRACAS_WEB']+"/dokter/listdok"
		end
		res_spesialis = HTTParty.get(url_spesialis)
		@list_spesialis = res_spesialis.parsed_response
		@dataspesialis = @list_spesialis['content']['data']
		
		# data=[]
		# @dataspesialis.each do |re|
		# 	var = "#{re['name']}-#{re['id']}"
		# 	data.push(var)
		# end

		render json: @dataspesialis
		return

	end

	def dokter_list_id
		@keyword = params['keyword'].present? ? params['keyword'] : ''
	
		if @keyword.present?
			url_spesialis = ENV['CIRACAS_WEB']+"/dokter/listdok?keyword=#{@keyword}"
		else
			url_spesialis = ENV['CIRACAS_WEB']+"/dokter/listdok"
		end
		res_spesialis = HTTParty.get(url_spesialis)
		@list_spesialis = res_spesialis.parsed_response
		@dataspesialis = @list_spesialis['content']['data']
		
		data=[]
		@dataspesialis.each do |re|
			
			data.push(re['id'])
		end
		
		render json: data
		return

	end

	def jadwal_dokter
	  	@keyword = params['dokter']
		
	  	@key_split = @keyword.split("-")
		
		if @keyword.present?
			url_jadwal = ENV['CIRACAS_WEB']+"/jadwal_praktek/list?keyword=#{@key_split[1]}"
		else
			url_jadwal = ENV['CIRACAS_WEB']+"/jadwal_praktek/list"
		end

		res_jadwal = HTTParty.get(url_jadwal)
		@list_jadwal = res_jadwal.parsed_response
		@datajadwal = @list_jadwal['content']['data']
		@datajadwalimage = @datajadwal[0]

	#   render json:  @keyword
	#   return

	end
	
	def list_dokter_spesialis
		@keyword = params['keyword'].present? ? params['keyword'] : ''
	
		if @keyword.present?
			url_spesialis = ENV['CIRACAS_WEB']+"/spesialis/listsp?keyword=#{@keyword}"
		else
			url_spesialis = ENV['CIRACAS_WEB']+"/spesialis/listsp"
		end
		res_spesialis = HTTParty.get(url_spesialis)
		@list_spesialis = res_spesialis.parsed_response
		@dataspesialis = @list_spesialis['content']['data']

		render json: @dataspesialis
		return
	end

	def dokter_spesialis
		@keyword = params['keyword'].present? ? params['keyword'] : ''
	
		if @keyword.present?
			url_spesialis = ENV['CIRACAS_WEB']+"/spesialis/list?keyword=#{@keyword}"
		else
			url_spesialis = ENV['CIRACAS_WEB']+"/spesialis/list"
		end
		res_spesialis = HTTParty.get(url_spesialis)
		@list_spesialis = res_spesialis.parsed_response
		@dataspesialis = @list_spesialis['content']['data']

		render json: @dataspesialis
		return
	end

	def jadwal_dokter_spesialis
		@keyword = params['dokter']
	  
		@key_split = @keyword.split("-")
	  
		if @keyword.present?
			url_jadwal = ENV['CIRACAS_WEB']+"/dokter/jenis?keyword=#{@key_split[1]}"
		else
			url_jadwal = ENV['CIRACAS_WEB']+"/dokter/jenis"
		end

		res_jadwal = HTTParty.get(url_jadwal)
		@list_jadwal = res_jadwal.parsed_response
		@datajadwal = @list_jadwal['content']['data']
		@datajadwalimage = @datajadwal[0]

		# render json:  @datajadwal
		# return

  end

	def dokter_get
		url_spesialis = ENV['CIRACAS_WEB']+"spesialis"
		res_spesialis = HTTParty.get(url_spesialis)
		@list_spesialis = res_spesialis.parsed_response
		@dataspesialis = @list_spesialis['content']['data']

		@spes_id = params[:id].present? ? params[:id] : 1
		
			url_spe1 = ENV['CIRACAS_WEB']+"dokter/listjenis?spesialis_id=#{@spes_id}"
			res_spe1 = HTTParty.get(url_spe1)
			@data_spe1 = res_spe1.parsed_response
			@dataspe1 = @data_spe1['content']['data'] rescue ''

			# @dataspe1.each do |rep|
			# 	rep['image_url'] = "#{ENV['CIRACAS_WEB']}#{rep['image_url']}"
			# end

		# render json: @spes_id
		# return

	end

	def kontak
		
	end

	def galeri
		url_galeri = ENV['CIRACAS_WEB']+"galeri/list"
		res_galeri = HTTParty.get(url_galeri)
		@list_galeri = res_galeri.parsed_response
		@datagaleri = @list_galeri['content']['data'] rescue ''

	end

	def aksi_kontak
		nama = params['name']
		email = params['email']
		pesan = params['message']

		data = {
			nama: nama,
			email: email,
			pesan: pesan
		}
		
		@hubungiPesan = ApplicationHelper.req_post('hubungi',data,"token")
		
		render json: @hubungiPesan
		return
	end

	def about_us

		#start partner#

		url_about = ENV['CIRACAS_WEB']+"partner/list_partner"
		res_about = HTTParty.get(url_about)

		@list_about = res_about.parsed_response

		@data = @list_about['content']['data']

		@dataarray1 =[]
		@dataarray2 =[]

		if @data['data_asc'].present?
			count = @data['data_asc'].count
			if count > 0
				split = count/2
				@data['data_asc'][0..split-1].each do |val|
					data1 = {
						nama: val['nama'],
						status: val['status'],
						image: val['image']
					}
					@dataarray1.push(data1)
				end

				@data['data_asc'][split..count].each do |val|
					data2 = {
						nama: val['nama'],
						status: val['status'],
						image: val['image']
					}
					@dataarray2.push(data2)
				end
			end
		end
		#end partner#


		url_team = ENV['CIRACAS_WEB']+"team/list_team_head"
		res_team = HTTParty.get(url_team)

		@list_team1 = res_team.parsed_response

		@data1 = @list_team1['content']['data']

		url_plan_flow = "aset/list_by_flagging?flagging=plan_flow"
		@data_plan_flow = ApplicationHelper.req_get(url_plan_flow,'')
		@data_plan_flow = @data_plan_flow['content']['data'].present? ? @data_plan_flow['content']['data'] : '' rescue ''

		# render json: @data_plan_flow
		# return
	end
	

	def aksi_contact_us
		nama = params['first_name']
		nama_belakang = params['last_name']
		email = params['email']
		pesan = params['message']

		data = {
			nama: nama,
			nama_belakang: nama_belakang,
			email: email,
			pesan: pesan
		}
		
		@hubungiPesan = ApplicationHelper.req_post('hubungi',data,"token")
		
		render json: @hubungiPesan
		return
	end

	def pages
		# Page
		@page = params[:key].present? ? params[:key] : 1
		@slug = params[:slug].present? ? params[:slug] : 1

		url_pages = ENV['CIRACAS_WEB']+"pages/"+@slug

		res_pages = HTTParty.get(
			url_pages
		)
		
		@data_pages = res_pages.parsed_response
		# render json: @data_pages
		# return
		
		if @data_pages['status']

			@pages = @data_pages['content']
			
			if @pages.present?

				@title = @pages['page'] rescue ""
				@title_header = @pages['page'] rescue ""
				@short_desc = @pages['short_desc']
				@content = @pages['content']
				@image_pages = ENV['CIRACAS_WEB']+@pages['image_url'].to_s

			else
				@pages = nil
			end
		else
			# redirect_to '../../companyprofile/home/lyt_network_error'
			# return
		end
		# Tutup Page


		return
	
	end
  
end
