class Backoffice::MasterController < ApplicationController
  layout "temp_bo"
  skip_before_action :verify_authenticity_token
  before_action :check_session, :get_moduls

  def user 
    
    @limit =  params[:limit].present? ? params[:limit].to_i : 20
    @page = params[:page].present? ? params[:page].to_i : 1
    @keyword = params[:keyword].present? ? params[:keyword] : ''

    if @keyword.present?
      url = "users?cari=#{@keyword}"
    else
      url = "users?limit=#{@limit}&page=#{@page}&cari=#{@keyword}"
    end

    @data = ApplicationHelper.req_get(url,session['sess']['my_token'])
    @meta = @data['content']['meta'] rescue ""

    url = "user_roles"
    @user_roles = ApplicationHelper.req_get(url,session['sess']['my_token'])
    
  end

  def aksi_user
    
    data = {
      phone: params['phone'],
      # password: Digest::MD5.hexdigest(params[:password]),
      password: params[:password],
      name: params['name'],
      email: params['email'],
      status: params['status'],
      user_role_id: params['user_role_id']
    }
    
    if params['id'] == '' # simpan
      url = "users"
      @aksi = ApplicationHelper.req_post(url,data,session['sess']['my_token'])
    else # update 
      url = "users/"+params['id']
      @aksi = ApplicationHelper.req_put(url,data,session['sess']['my_token'])
    end
  
    if @aksi['status'] == true
      flash[:alert] = "success"
    else
      flash[:alert] = "danger"
    end
    flash[:notice] = @aksi['message']
    redirect_to '/backoffice/master/user'
  end

  def user_role
    @limit =  params[:limit].present? ? params[:limit].to_i : 20
    @page = params[:page].present? ? params[:page].to_i : 1
    @keyword = params[:keyword].present? ? params[:keyword] : ''

    if @keyword.present?
      url = "user_roles?cari=#{@keyword}"
    else
      url = "user_roles?limit=#{@limit}&page=#{@page}&cari=#{@keyword}"
    end
   
    @data = ApplicationHelper.req_get(url,session['sess']['my_token'])
    @meta = @data['content']['meta'] rescue ""
    
  end

  def aksi_user_role
  
    data = {
      role: params['name'],
      status: params['status']
    }
    if params['id'] == '' # simpan
      url = "user_roles"
      @aksi = ApplicationHelper.req_post(url,data,session['sess']['my_token'])
    else # update 
      url = "user_roles/"+params['id']
      @aksi = ApplicationHelper.req_put(url,data,session['sess']['my_token'])
    end
    
    if @aksi['status'] == true
      flash[:alert] = "success"
    else
      flash[:alert] = "danger"
    end
    flash[:notice] = @aksi['message']
    redirect_to '/backoffice/master/user_role'
  end

  def modul

    @limit =  params[:limit].present? ? params[:limit].to_i : 20
    @page = params[:page].present? ? params[:page].to_i : 1
    @keyword = params[:keyword].present? ? params[:keyword] : ''
    
    if @keyword.present?
      url = "modul?cari=#{@keyword}"
    else
      url = "modul?limit=#{@limit}&page=#{@page}&cari=#{@keyword}"
    end
   
    @data = ApplicationHelper.req_get(url,session['sess']['my_token'])
    @meta = @data['content']['meta'] rescue ""
    
    
  end

  def aksi_modul
    
    data = {
      modul: params['name'],
      status: params['status'],
      url: params['url']
    }

    if params['id'] == '' # simpan   
      url = "modul"
      @aksi = ApplicationHelper.req_post(url,data,session['sess']['my_token'])
    else # update 
      url = "modul/"+params['id']
      @aksi = ApplicationHelper.req_put(url,data,session['sess']['my_token'])
    end

    if @aksi['status'] == true
      flash[:alert] = "success"
    else
      flash[:alert] = "danger"
    end
    flash[:notice] = @aksi['message']
    redirect_to '/backoffice/master/modul'
  end
  
  def akses_modul

    @limit =  params[:limit].present? ? params[:limit].to_i : 20
    @keyword = params[:keyword].present? ? params[:keyword] : ''
    @page = params[:page].present? ? params[:page].to_i : 1

    if @keyword.present?
      url = "akses_modul?cari=#{@keyword}"
    else
      url = "akses_modul?limit=#{@limit}&page=#{@page}&cari=#{@keyword}"
    end
    
    @data = ApplicationHelper.req_get(url,session['sess']['my_token'])
    @meta = @data['content']['meta'] rescue ""

    url_user = "user_roles"
    @data_user = ApplicationHelper.req_get(url_user,session['sess']['my_token'])

    url_modul = "modul"
    @data_modul = ApplicationHelper.req_get(url_modul,session['sess']['my_token'])

  end

  def aksi_modul_akses
    
    data = {
      modul_id: params['modul'],
      user_role_id: params['user'],
    }

    if params['id'] == '' # simpan
      url = "akses_modul"
      @aksi = ApplicationHelper.req_post(url,data,session['sess']['my_token'])
    else # update S
      url = "akses_modul/"+params['id']
      @aksi = ApplicationHelper.req_put(url,data,session['sess']['my_token'])
    end
    
    if @aksi['status'] == true
      flash[:alert] = "Success"
    else
      flash[:alert] = "Gagal"
    end
    flash[:notice] = flash[:alert]
    redirect_to '/backoffice/master/akses_modul'
  end

  def system_setting  
    @limit =  params[:limit].present? ? params[:limit].to_i : 20
    @page = params[:page].present? ? params[:page].to_i : 1
    @keyword = params[:keyword].present? ? params[:keyword] : ''

    if @keyword.present?
      url = "system_setting?cari=#{@keyword}"
    else
      url = "system_setting?limit=#{@limit}&page=#{@page}&cari=#{@keyword}"
    end
    
    @data = ApplicationHelper.req_get(url,session['sess']['my_token'])
    @meta = @data['content']['meta'] rescue ""
  end

  def edit_system_setting
    url = "system_setting/#{params['id']}"
    @data = ApplicationHelper.req_get(url,session['sess']['my_token'])['content']
  end
  
  def aksi_system_setting
   
    images = params['images'] if params['images'].present?
    data = {
      sys_key: params['sys_key'],
      sys_val: params['value'],
      status: params['status'],
      images: images
    }
    
    if params['id'] == '' # simpan
      url = "system_setting"
      @aksi = ApplicationHelper.req_post(url,data,session['sess']['my_token'])
    else # update 
      url = "system_setting/"+params['id']
      @aksi = ApplicationHelper.req_put(url,data,session['sess']['my_token'])
    end

    # render json: @aksi
    # return
    if @aksi['status'] == true
      flash[:alert] = "success"
    else
      flash[:alert] = "danger"
    end
    flash[:notice] = @aksi['message']
    redirect_to '/backoffice/master/system_setting'
  end

  def banner
    @limit =  params[:limit].present? ? params[:limit].to_i : 20
    @page = params[:page].present? ? params[:page].to_i : 1
    @keyword = params[:keyword].present? ? params[:keyword] : ''

    if @keyword.present?
      url = "banners?cari=#{@keyword}"
    else
      url = "banners?limit=#{@limit}&page=#{@page}&cari=#{@keyword}"
    end

    @data = ApplicationHelper.req_get(url,session['sess']['my_token'])
    @meta = @data['content']['meta'] rescue ""
  end

  def edit_banner
    url = "banners/#{params['id']}"
    @data = ApplicationHelper.req_get(url,session['sess']['my_token'])['content']
    # render json: @data
    # return
  end

  def aksi_banner
    images = params['image'] if params['image'].present?
    data = {
      status: params['status'],
      urutan: params['urutan'],
      image: images
    }
   
    if params['id'] == '' # simpan
      url = "banners"
      @aksi = ApplicationHelper.req_post(url,data,session['sess']['my_token'])
     
    else # update 
      url = "banners/"+params['id']
      @aksi = ApplicationHelper.req_put(url,data,session['sess']['my_token'])
    end

    if @aksi['status'] == true
      flash[:alert] = "success"
    else
      flash[:alert] = "danger"
    end
    flash[:notice] = @aksi['message']
    redirect_to '/backoffice/master/banner'

  end

  def pages
    @limit =  params[:limit].present? ? params[:limit].to_i : 20
    @page = params[:page].present? ? params[:page].to_i : 1
    @keyword = params[:keyword].present? ? params[:keyword] : ''
    
    if @keyword.present?
      url = "page?cari=#{@keyword}"
    else
      url = "page?limit=#{@limit}&page=#{@page}&cari=#{@keyword}"
    end

    @data = ApplicationHelper.req_get(url,session['sess']['my_token'])
    @meta = @data['content']['meta'] rescue ""

    # render json: @data
    # return
  end

  def edit_pages
    url = "page/#{params['id']}"
    @data = ApplicationHelper.req_get(url,session['sess']['my_token'])['content']
    
    # render json: @data
    # return
  end
  
  def aksi_pages
    # render json: data
    # return
    if params['id'] == '' # simpan
      if params['cover'].present?
        data = {
          page: params['page'],
          short_desc: params['short_desc'],
          content: params['content'],
          url: params['url'],
          cover: params['cover'],
          status: params['status'],
          keyword: params['keyword'],
          created_by: session['sess']['name'],
        }
      else
        data = {
          page: params['page'],
          short_desc: params['short_desc'],
          content: params['content'],
          url: params['url'],
          status: params['status'],
          keyword: params['keyword'],
          created_by: session['sess']['name'],
        }
      end

      url = "page"
      @aksi = ApplicationHelper.req_post(url,data,session['sess']['my_token'])
     
    else # update 
      if params['cover'].present?
        data = {
          page: params['page'],
          short_desc: params['short_desc'],
          content: params['content'],
          url: params['url'],
          cover: params['cover'],
          status: params['status'],
          keyword: params['keyword'],
          updated_by: session['sess']['name'],
        }
      else
        data = {
          page: params['page'],
          short_desc: params['short_desc'],
          content: params['content'],
          url: params['url'],
          status: params['status'],
          keyword: params['keyword'],
          updated_by: session['sess']['name'],
        }
      end

      url = "page/"+params['id']
      @aksi = ApplicationHelper.req_put(url,data,session['sess']['my_token'])
    end

    if @aksi['status'] == true
      flash[:alert] = "success"
    else
      flash[:alert] = "danger"
    end
    flash[:notice] = @aksi['message']
    redirect_to '/backoffice/master/pages'
  end

  def delete_pages
    url = "page/"+params['id']
    if params['cover'].present?
      data = {
        page: params['page'],
        short_desc: params['short_desc'],
        content: params['content'],
        url: params['url'],
        cover: params['cover'],
        status: params['status'],
        keyword: params['keyword']
      }
    else
      data = {
        page: params['page'],
        short_desc: params['short_desc'],
        content: params['content'],
        url: params['url'],
        status: params['status'],
        keyword: params['keyword']
      }
    end
    @aksi = ApplicationHelper.req_del(url,data,session['sess']['my_token'])['content']

    if @aksi['status'] == true
      flash[:alert] = "success"
    else
      flash[:alert] = "danger"
    end
    flash[:notice] = @aksi['message']
    redirect_to '/backoffice/master/pages'
  end
  
  def menu  
    @limit =  params[:limit].present? ? params[:limit].to_i : 20
    @page = params[:page].present? ? params[:page].to_i : 1
    @keyword = params[:keyword].present? ? params[:keyword] : ''
    
    if @keyword.present?
      url = "menu?cari=#{@keyword}"
    else
      url = "menu?limit=#{@limit}&page=#{@page}&cari=#{@keyword}"
    end
    
    @data = ApplicationHelper.req_get(url,session['sess']['my_token'])
    @dataall = ApplicationHelper.req_get('menu/listfe',session['sess']['my_token'])

    urlpages = "page/alldata"
    @datapages = ApplicationHelper.req_get(urlpages,session['sess']['my_token'])
    @meta = @data['content']['meta'] rescue ""

  end
  
  def aksi_menu
    if (params['content'] == 'url')
      pages = ''
      url = params['url']
    else
      pages = params['pages']
      url = ''
    end
    data = {
      menu: params['menu'],
      url: url,
      status: params['status'],
      urutan: params['urutan'],
      page_id: pages,
      parents: params['parents'],
      content: params['content']
    }
    
    if params['id'] == '' # simpan
      url = "menu"
      @aksi = ApplicationHelper.req_post(url,data,session['sess']['my_token'])
    else # update 
      url = "menu/"+params['id']
      @aksi = ApplicationHelper.req_put(url,data,session['sess']['my_token'])
    end
    if @aksi['status'] == true
      flash[:alert] = "success"
    else
      flash[:alert] = "danger"
    end
    flash[:notice] = @aksi['message']
    redirect_to '/backoffice/master/menu'
  end

  def news
    @limit =  params[:limit].present? ? params[:limit].to_i : 10
    @page = params[:page].present? ? params[:page].to_i : 1
    @keyword = params[:keyword].present? ? params[:keyword] : ''

    if @keyword.present?
      url = "news?cari=#{@keyword}"
    else
      url = "news?limit=#{@limit}&page=#{@page}&cari=#{@keyword}"
    end

    @data = ApplicationHelper.req_get(url,session['sess']['my_token'])
    @meta = @data['content']['meta'] rescue ""
    
  end

  def edit_news
    url = "news/#{params['id']}"
    @data = ApplicationHelper.req_get(url,session['sess']['my_token'])['content']
  end

  def aksi_news
    
   
    if params['id'] == '' # simpan
      data = {
        title: params['title'],
        image: params['images'],
        status: params['status'],
        desc: params['content'],
        created_by: session['sess']['name'],
      }
      url = "news"
      @aksi = ApplicationHelper.req_post(url,data,session['sess']['my_token'])
     
    else # update 
      data = {
        title: params['title'],
        image: params['images'],
        status: params['status'],
        desc: params['content'],
        updated_by: session['sess']['name'],
      }
      url = "news/"+params['id']
      @aksi = ApplicationHelper.req_put(url,data,session['sess']['my_token'])
    end


    if @aksi['status'] == true
      flash[:alert] = "success"
    else
      flash[:alert] = "danger"
    end
    
    if @aksi['status'] == true
      flash[:notice] = @aksi['message']
    else
      flash[:notice] = @aksi['content']
    end
    
    redirect_to '/backoffice/master/news'
  end

  def pelayanan
    @limit =  params[:limit].present? ? params[:limit].to_i : 10
    @page = params[:page].present? ? params[:page].to_i : 1
    @keyword = params[:keyword].present? ? params[:keyword] : ''

    if @keyword.present?
      url = "pelayanan?keyword=#{@keyword}"
    else
      url = "pelayanan?limit=#{@limit}&page=#{@page}&keyword=#{@keyword}"
    end

    @data = ApplicationHelper.req_get(url,session['sess']['my_token'])
    @meta = @data['content']['meta'] rescue ""

    url_jenis = "jenis_rawat"
    @data_jenis = ApplicationHelper.req_get(url_jenis,session['sess']['my_token'])
  end

  def edit_pelayanan
    url = "pelayanan/#{params['id']}"
    @data = ApplicationHelper.req_get(url,session['sess']['my_token'])['content']

    url_jenis = "jenis_rawat"
    @datajenis = ApplicationHelper.req_get(url_jenis,session['sess']['my_token'])
  end

  def aksi_pelayanan
   
    # render json: data
    # return
    if params['id'] == '' # simpan
      data = {
        nama: params['nama'],
        subdesc: params['subdesc'],
        desc: params['content'],
        images: params['images'],
        urutan: params['urutan'],
        status: params['status'],
        lantai: params['lantai'],
        jenis_rawat_id: params['jenis_rawat_id'].to_s,
        created_by: session['sess']['name'],
      }
      url = "pelayanan"
      @aksi = ApplicationHelper.req_post(url,data,session['sess']['my_token'])
     
    else # update 
      data = {
        nama: params['nama'],
        subdesc: params['subdesc'],
        desc: params['content'],
        images: params['images'],
        urutan: params['urutan'],
        status: params['status'],
        lantai: params['lantai'],
        jenis_rawat_id: params['jenis_rawat_id'].to_s,
        updated_by: session['sess']['name'],
      }
      url = "pelayanan/"+params['id']
      @aksi = ApplicationHelper.req_put(url,data,session['sess']['my_token'])
    end


    if @aksi['status'] == true
      flash[:alert] = "success"
    else
      flash[:alert] = "danger"
    end
    
    if @aksi['status'] == true
      flash[:notice] = @aksi['message']
    else
      flash[:notice] = @aksi['content']
    end
    
    redirect_to '/backoffice/master/pelayanan'
  end

  def dokter
    @limit =  params[:limit].present? ? params[:limit].to_i : 10
    @page = params[:page].present? ? params[:page].to_i : 1
    @keyword = params[:keyword].present? ? params[:keyword] : ''

    if @keyword.present?
      url = "dokter?keyword=#{@keyword}"
    else
      url = "dokter?limit=#{@limit}&page=#{@page}&keyword=#{@keyword}"
    end

    @data = ApplicationHelper.req_get(url,session['sess']['my_token'])
    @meta = @data['content']['meta'] rescue ""

    url2 = "spesialis"
    @spesialis = ApplicationHelper.req_get(url2,session['sess']['my_token'])

    # render json: @spesialis
    # return
  end

  def edit_dokter
    url = "dokter/#{params['id']}"
    @data = ApplicationHelper.req_get(url,session['sess']['my_token'])['content']
     
    url2 = "spesialis"
    @spesialis = ApplicationHelper.req_get(url2,session['sess']['my_token'])
  end

  def aksi_dokter
    data = {
      name: params['nama'],
      spesialis_id: params['spesialis_id'],
      content: params['content'],
      image: params['images'],
      status: params['status'],
      is_spesialis: params['is_spesialis']
    }
    # render json: data
    # return
    if params['id'] == '' # simpan
      url = "dokter"
      @aksi = ApplicationHelper.req_post(url,data,session['sess']['my_token'])
     
    else # update 
      url = "dokter/"+params['id']
      @aksi = ApplicationHelper.req_put(url,data,session['sess']['my_token'])
    end


    if @aksi['status'] == true
      flash[:alert] = "success"
    else
      flash[:alert] = "danger"
    end
    
    if @aksi['status'] == true
      flash[:notice] = @aksi['message']
    else
      flash[:notice] = @aksi['content']
    end
    
    redirect_to '/backoffice/master/dokter'
  end

  def jadwal_dokter
    @limit =  params[:limit].present? ? params[:limit].to_i : 10
    @page = params[:page].present? ? params[:page].to_i : 1
    @keyword = params[:keyword].present? ? params[:keyword] : ''

    if @keyword.present?
      url = "jadwal_praktek?keyword=#{@keyword}"
    else
      url = "jadwal_praktek?limit=#{@limit}&page=#{@page}&keyword=#{@keyword}"
    end

    @data = ApplicationHelper.req_get(url,session['sess']['my_token'])
    @meta = @data['content']['meta'] rescue ""

    url_dokter = "dokter/listdok"
    @data_dokter = ApplicationHelper.req_get(url_dokter,session['sess']['my_token'])

    url_spes = "spesialis/listfe"
    @data_spes = ApplicationHelper.req_get(url_spes,session['sess']['my_token'])
  end

  def aksi_jadwal_dokter
    data = {
      nama: params['nama'],
      dokterID: params['dokterID'],
      hari: params['hari'],
      waktu: params['waktu'],
      jamMulai: params['jamMulai'],
      jamSelesai: params['jamSelesai'],
      status: params['status'],
    }
    # render json: data
    # return
    if params['id'] == '' # simpan
      url = "jadwal_praktek"
      @aksi = ApplicationHelper.req_post(url,data,session['sess']['my_token'])
     
    else # update 
      url = "jadwal_praktek/"+params['id']
      @aksi = ApplicationHelper.req_put(url,data,session['sess']['my_token'])
    end


    if @aksi['status'] == true
      flash[:alert] = "success"
    else
      flash[:alert] = "danger"
    end
    
    if @aksi['status'] == true
      flash[:notice] = @aksi['message']
    else
      flash[:notice] = @aksi['content']
    end
    
    redirect_to '/backoffice/master/jadwal_dokter'
  end

  def galeri
    @limit =  params[:limit].present? ? params[:limit].to_i : 10
    @page = params[:page].present? ? params[:page].to_i : 1
    @keyword = params[:keyword].present? ? params[:keyword] : ''

    if @keyword.present?
      url = "galeri?keyword=#{@keyword}"
    else
      url = "galeri?limit=#{@limit}&page=#{@page}&keyword=#{@keyword}"
    end

    @data = ApplicationHelper.req_get(url,session['sess']['my_token'])
    @meta = @data['content']['meta'] rescue ""
  end

  def edit_galeri
    url = "galeri/#{params['id']}"
    @data = ApplicationHelper.req_get(url,session['sess']['my_token'])['content']
    # render json: @data
    # return
  end

  def aksi_galeri
    images = params['image'] if params['image'].present?
    data = {
      status: params['status'],
      title: params['title'],
      image: images
    }
   
    if params['id'] == '' # simpan
      url = "galeri"
      @aksi = ApplicationHelper.req_post(url,data,session['sess']['my_token'])
     
    else # update 
      url = "galeri/"+params['id']
      @aksi = ApplicationHelper.req_put(url,data,session['sess']['my_token'])
    end

    if @aksi['status'] == true
      flash[:alert] = "success"
    else
      flash[:alert] = "danger"
    end
    flash[:notice] = @aksi['message']
    redirect_to '/backoffice/master/galeri'

  end

  def hubungi 
    
    @limit =  params[:limit].present? ? params[:limit].to_i : 10
    @page = params[:page].present? ? params[:page].to_i : 1
    @keyword = params[:keyword].present? ? params[:keyword] : ''

    if @keyword.present?
      url = "hubungi?keyword=#{@keyword}"
    else
      url = "hubungi?limit=#{@limit}&page=#{@page}&keyword=#{@keyword}"
    end

    @data = ApplicationHelper.req_get(url,session['sess']['my_token'])
    @meta = @data['content']['meta'] rescue ""
    
  end

  def aksi_hubungi
      data = {
        nama: params['nama'],
        email: params['email'],
        pesan: params['pesan'],
      }
      
      url = "hubungi_kamis/"+params['id']
      @aksi = ApplicationHelper.req_del(url,data,session['sess']['my_token'])
  
    if @aksi['status'] == true
      flash[:alert] = "success"
    else
      flash[:alert] = "danger"
    end
    
    if @aksi['status'] == true
      flash[:notice] = @aksi['message']
    else
      flash[:notice] = @aksi['content']
    end
    
    redirect_to '/backoffice/master/hubungi'
  end

  def divisi

    @limit =  params[:limit].present? ? params[:limit].to_i : 20
    @page = params[:page].present? ? params[:page].to_i : 1
    @keyword = params[:keyword].present? ? params[:keyword] : ''

    
    if @keyword.present?
      url = "divsi?cari=#{@keyword}"
    else
      url = "divisi?limit=#{@limit}&page=#{@page}&cari=#{@keyword}"
    end
   
    @data = ApplicationHelper.req_get(url,session['sess']['my_token'])
    @meta = @data['content']['meta'] rescue ""

    url_parents = 'divisi/list_parents'
    @data_parents = ApplicationHelper.req_get(url,session['sess']['my_token'])
    
  end

  def aksi_divisi
    
    data = {
      nama: params['nama'],
      status: params['status'],
      parents: params['parents']
    }

    if params['id'] == '' # simpan   
      url = "divisi"
      @aksi = ApplicationHelper.req_post(url,data,session['sess']['my_token'])
    else # update 
      url = "divisi/"+params['id']
      @aksi = ApplicationHelper.req_put(url,data,session['sess']['my_token'])
    end

    if @aksi['status'] == true
      flash[:alert] = "success"
    else
      flash[:alert] = "danger"
    end
    flash[:notice] = @aksi['message']
    redirect_to '/backoffice/master/divisi'
  end

  def partner

    @limit =  params[:limit].present? ? params[:limit].to_i : 20
    @page = params[:page].present? ? params[:page].to_i : 1
    @keyword = params[:keyword].present? ? params[:keyword] : ''

    
    if @keyword.present?
      url = "partner?cari=#{@keyword}"
    else
      url = "partner?limit=#{@limit}&page=#{@page}&cari=#{@keyword}"
    end
   
    @data = ApplicationHelper.req_get(url,session['sess']['my_token'])
    @meta = @data['content']['meta'] rescue ""
   
  end

  def edit_partner
    url = "partner/#{params['id']}"
    @data = ApplicationHelper.req_get(url,session['sess']['my_token'])['content']
  end

  def aksi_partner
    data = {
      nama: params['nama'],
      status: params['status'],
      images: params['images']
    }

    if params['id'] == '' # simpan   
      url = "partner"
      @aksi = ApplicationHelper.req_post(url,data,session['sess']['my_token'])
    else # update 
      url = "partner/"+params['id']
      @aksi = ApplicationHelper.req_put(url,data,session['sess']['my_token'])
    end

    if @aksi['status'] == true
      flash[:alert] = "success"
    else
      flash[:alert] = "danger"
    end
    flash[:notice] = @aksi['message']
    redirect_to '/backoffice/master/partner'
  end

  def faq

    @limit =  params[:limit].present? ? params[:limit].to_i : 20
    @page = params[:page].present? ? params[:page].to_i : 1
    @keyword = params[:keyword].present? ? params[:keyword] : ''

    
    if @keyword.present?
      url = "question?cari=#{@keyword}"
    else
      url = "question?limit=#{@limit}&page=#{@page}&cari=#{@keyword}"
    end
   
    @data = ApplicationHelper.req_get(url,session['sess']['my_token'])
    @meta = @data['content']['meta'] rescue ""
  end

  def aksi_faq
    data = {
      pertanyaan: params['pertanyaan'],
      status: params['status'],
      jawaban: params['jawaban']
    }

    if params['id'] == '' # simpan   
      url = "question"
      @aksi = ApplicationHelper.req_post(url,data,session['sess']['my_token'])
    else # update 
      url = "question/"+params['id']
      @aksi = ApplicationHelper.req_put(url,data,session['sess']['my_token'])
    end

    if @aksi['status'] == true
      flash[:alert] = "success"
    else
      flash[:alert] = "danger"
    end
    flash[:notice] = @aksi['message']
    redirect_to '/backoffice/master/faq'
  end
  
  def team

    @limit =  params[:limit].present? ? params[:limit].to_i : 10
    @page = params[:page].present? ? params[:page].to_i : 1
    @keyword = params[:keyword].present? ? params[:keyword] : ''

    
    if @keyword.present?
      url = "team?cari=#{@keyword}"
    else
      url = "team?limit=#{@limit}&page=#{@page}&cari=#{@keyword}"
    end
   
    @data = ApplicationHelper.req_get(url,session['sess']['my_token'])
    @meta = @data['content']['meta'] rescue ""

    url_divisi = 'divisi.list_parents'
    @data_divisi = ApplicationHelper.req_get(url_divisi,session['sess']['my_token'])
   
  end

  def edit_team
    url = "team/#{params['id']}"
    @data = ApplicationHelper.req_get(url,session['sess']['my_token'])['content']

    url_divisi = 'divisi/list_parents'
    @data_divisi = ApplicationHelper.req_get(url_divisi,session['sess']['my_token'])
  end

  def aksi_team
    data = {
      nama: params['nama'],
      status: params['status'],
      images: params['images'],
      jabatan: params['jabatan'],
      divisi: params['divisi'],
      position: params['position']
    }

    if params['id'] == '' # simpan   
      url = "team"
      @aksi = ApplicationHelper.req_post(url,data,session['sess']['my_token'])
    else # update 
      url = "team/"+params['id']
      @aksi = ApplicationHelper.req_put(url,data,session['sess']['my_token'])
    end

    if @aksi['status'] == true
      flash[:alert] = "success"
    else
      flash[:alert] = "danger"
    end
    flash[:notice] = @aksi['message']
    redirect_to '/backoffice/master/team'
  end

  def job

    @limit =  params[:limit].present? ? params[:limit].to_i : 10
    @page = params[:page].present? ? params[:page].to_i : 1
    @keyword = params[:keyword].present? ? params[:keyword] : ''

    
    if @keyword.present?
      url = "job?cari=#{@keyword}"
    else
      url = "job?limit=#{@limit}&page=#{@page}&cari=#{@keyword}"
    end
   
    @data = ApplicationHelper.req_get(url,session['sess']['my_token'])
    @meta = @data['content']['meta'] rescue ""

    url_divisi = 'divisi/list_child'
    @data_divisi = ApplicationHelper.req_get(url_divisi,session['sess']['my_token'])

  end

  def edit_job
    url = "job/#{params['id']}"
    @data = ApplicationHelper.req_get(url,session['sess']['my_token'])['content']

    url_divisi = 'divisi/list_child'
    @data_divisi = ApplicationHelper.req_get(url_divisi,session['sess']['my_token'])

    #  render json: @data
    # return
  end

  def aksi_job
    #  render json: params
    # return
    data = {
      judul: params['title'],
      level: params['level'],
      tahun: params['tahun'],
      qualification: params['qualification'],
      job_type: params['job_type'],
      divisi_id: params['divisi_id'],
      desc: params['desc'],
      status: params['status'],
    }

    if params['id'] == '' # simpan   
      url = "job"
      @aksi = ApplicationHelper.req_post(url,data,session['sess']['my_token'])
    else # update 
      url = "job/"+params['id']
      @aksi = ApplicationHelper.req_put(url,data,session['sess']['my_token'])
    end

    if @aksi['status'] == true
      flash[:alert] = "success"
    else
      flash[:alert] = "danger"
    end
    flash[:notice] = @aksi['message']
    redirect_to '/backoffice/master/job'
  end

  def subscription

    @limit =  params[:limit].present? ? params[:limit].to_i : 20
    @page = params[:page].present? ? params[:page].to_i : 1
    @keyword = params[:keyword].present? ? params[:keyword] : ''

    
    if @keyword.present?
      url = "subscription?cari=#{@keyword}"
    else
      url = "subscription?limit=#{@limit}&page=#{@page}&cari=#{@keyword}"
    end
   
    @data = ApplicationHelper.req_get(url,session['sess']['my_token'])
    @meta = @data['content']['meta'] rescue ""

    # render json: @data
    # return
  end

  def aset

    @limit =  params[:limit].present? ? params[:limit].to_i : 20
    @page = params[:page].present? ? params[:page].to_i : 1
    @keyword = params[:keyword].present? ? params[:keyword] : ''

    
    if @keyword.present?
      url = "aset?cari=#{@keyword}"
    else
      url = "aset?limit=#{@limit}&page=#{@page}&cari=#{@keyword}"
    end
   
    @data = ApplicationHelper.req_get(url,session['sess']['my_token'])
    @meta = @data['content']['meta'] rescue ""

    # render json: @data
    # return
  end

  def edit_aset
    url = "aset/#{params['id']}"
    @data = ApplicationHelper.req_get(url,session['sess']['my_token'])['content']

    #  render json: @data
    # return
  end

  def aksi_aset
    #  render json: params
    # return
    data = {
      title: params['title'],
      desc: params['desc'],
      subtitle: params['subtitle'],
      flagging: params['flagging'],
      urutan: params['urutan'],
      status: params['status'],
      images: params['images'],
    }

    if params['id'] == '' # simpan   
      url = "aset"
      @aksi = ApplicationHelper.req_post(url,data,session['sess']['my_token'])
    else # update 
      url = "aset/"+params['id']
      @aksi = ApplicationHelper.req_put(url,data,session['sess']['my_token'])
    end

    if @aksi['status'] == true
      flash[:alert] = "success"
    else
      flash[:alert] = "danger"
    end
    flash[:notice] = @aksi['message']
    redirect_to '/backoffice/master/aset'
  end
end
