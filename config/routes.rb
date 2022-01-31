Rails.application.routes.draw do

  namespace :frontend do
    get 'home/index'
  end
  namespace :backoffice do
    root to: 'logins#index'
    resources :logins
    resources :transaksis
  end

  root 'companyprofile/home#mtm_home'


  get 'backoffice/home/index'
  get 'backoffice/home/logout'

  get 'backoffice/master/user'
  post 'backoffice/master/aksi_user'

  get 'backoffice/master/pelayanan'
  get 'backoffice/master/edit_pelayanan'
  post 'backoffice/master/aksi_pelayanan'

  get 'backoffice/master/galeri'
  get 'backoffice/master/edit_galeri'
  post 'backoffice/master/aksi_galeri'

  get 'backoffice/master/dokter'
  get 'backoffice/master/edit_dokter'
  post 'backoffice/master/aksi_dokter'


  get 'backoffice/master/jadwal_dokter'
  post 'backoffice/master/aksi_jadwal_dokter'

  get 'backoffice/master/faq'
  post 'backoffice/master/aksi_faq'

  get 'backoffice/master/partner'
  post 'backoffice/master/aksi_partner'
  get 'backoffice/master/edit_partner'

  get 'backoffice/master/team'
  post 'backoffice/master/aksi_team'
  get 'backoffice/master/edit_team'

  get 'backoffice/master/member'
  post 'backoffice/master/aksi_member'
  post 'backoffice/master/aksi_status_member'

  get 'backoffice/master/user_role'
  post 'backoffice/master/aksi_user_role'

  get 'backoffice/master/modul'
  post 'backoffice/master/aksi_modul'

  get 'backoffice/master/subscription'

  get 'backoffice/master/akses_modul'
  post 'backoffice/master/aksi_modul_akses'

  get 'backoffice/master/system_setting'
  get 'backoffice/master/edit_system_setting'
  post 'backoffice/master/aksi_system_setting'

  get 'backoffice/master/menu'
  post 'backoffice/master/aksi_menu'

  get 'backoffice/master/job'
  get 'backoffice/master/edit_job'
  post 'backoffice/master/aksi_job'

  get 'backoffice/master/aset'
  get 'backoffice/master/edit_aset'
  post 'backoffice/master/aksi_aset'

  get 'backoffice/master/pages'
  get 'backoffice/master/edit_pages'
  post 'backoffice/master/aksi_pages'
  get 'backoffice/master/delete_pages'

  get 'backoffice/master/catalog'
  post 'backoffice/master/aksi_catalog'

  get 'backoffice/master/news'
  get 'backoffice/master/edit_news'
  post 'backoffice/master/aksi_news'

  get 'backoffice/master/banner'
  get 'backoffice/master/edit_banner'
  post 'backoffice/master/aksi_banner'
  get 'backoffice/master/aksi_delete'

  get 'backoffice/master/hubungi'
  get 'backoffice/master/aksi_hubungi'


  # Company Profile

  get 'companyprofile/home/index'
  get 'companyprofile/home/dokter'
  get 'companyprofile/home/about'
  get 'companyprofile/home/logout_members'
  
  get '/contact_us', to: 'companyprofile/home#contact_us'
  post 'companyprofile/home/aksi_about_us'
  get '/produk', to: 'companyprofile/home#product'
  # get 'companyprofile/home/product'
  # get '/produk/katalog/:slugkatalog', to: 'companyprofile/home#product_katalog'
  get '/hubungi', to: 'companyprofile/home#hubungi'
  get '/login', to: 'companyprofile/home#login'
  # get '/newsdetail/:slug', to: 'companyprofile/home#newsdetail'
  post '/companyprofile/login_members/login_member'


  get '/pendaftaran', to: 'companyprofile/home#pendaftaran'
  post '/companyprofile/home/aksi_sub'
  post '/companyprofile/home/aksi_kontak'
  post '/companyprofile/home/hubungi_insert'
  post '/companyprofile/home/pendaftaran_insert'
  # get 'companyprofile/home/hubungi'
  # get '/produk/:slug', to: 'companyprofile/home#productdetail'
  # get 'companyprofile/home/productdetail'
  get 'companyprofile/home/lyt_network_error'
  post '/companyprofile/home/dokter_list'
  post '/companyprofile/home/dokter_list_id'
  post '/companyprofile/home/dokter_spesialis'
  post '/companyprofile/home/dokter_spesialis_id'
  post '/companyprofile/home/jadwal_dokter'
  get '/companyprofile/home/jadwal_dokter'
  post '/companyprofile/home/jadwal_dokter_spesialis'
  get '/companyprofile/home/jadwal_dokter_spesialis'
  get '/companyprofile/home/dokter_get'
  post '/companyprofile/home/dokter_'
  get '/companyprofile/home/dokter_'
  get '/companyprofile/home/jadwal_dokter_all'
  post '/companyprofile/home/jadwal_dokter_all'
  get '/companyprofile/home/pelayanan_get'
  get '/companyprofile/home/layanan'
  get '/pelayanan/detail/:nama', to: 'companyprofile/home#pelayanan_detail'
  # get ':key/:slug', to: 'companyprofile/home#pages'
  # Tutup Company Profile



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # mtmweb
  get '/mtm_home', to: 'companyprofile/home#mtm_home'
  get '/about_us', to: 'companyprofile/home#about_us'
  get '/newsdetail/:subtitle', to: 'companyprofile/home#newsdetail'
  get '/news', to: 'companyprofile/home#news'
  get '/contact_us', to: 'companyprofile/home#contact_us'
  get '/kontak', to: 'companyprofile/home#kontak'
  get '/dokter', to: 'companyprofile/home#dokter'
  get '/galeri', to: 'companyprofile/home#galeri'
  get '/layanan_rsud', to: 'companyprofile/home#layanan_rsud'
  get '/jobs_detail/:id', to: 'companyprofile/home#jobs_detail'
  get ':key/:slug', to: 'companyprofile/home#pages'
  get '/struktur-organisasi', to: 'companyprofile/home#struktur'
  get '/pelayanan', to: 'companyprofile/home#pelayanan'
  get '/visimisi', to: 'companyprofile/home#visimisi'
  get '/profile', to: 'companyprofile/home#profile'
  post 'companyprofile/home/aksi_contact_us'
  post 'companyprofile/home/aksi_jobs'
end
