class Backoffice::LoginsController < ApplicationController
  skip_before_action :verify_authenticity_token
  layout "temp_login_bo"
  require 'recaptcha'


  def index
    # render json: session
    # return
  end

  # check login via api
  # --------------------------------------------------
  # Jangan Jorok!!! Pikirin dev lain kalau nerusin ^^
  # Loe gak kerja sendirian.. ok?
  # --------------------------------------------------
  def create
    # if verify_recaptcha

      user = params['userName']
      pass = params['password']

      auth = get_token

      if auth['status']  == true
        role_id = auth['content']['user_role_id'].to_i
        my_token = auth['content']['token']
        name_ = auth['content']['username']

        my_sess = {
          name: name_,
          userName: user,
          password: pass,
          my_token: my_token,
          role_id: role_id,
          exp: auth['content']['exp']
        }
       
        session['sess'] = my_sess

        moduls = get_moduls

        redirect_to '/backoffice/home/index'
      else
        flash[:notice] = "Opps sepertinya kamu salah memasukan user / password"
        redirect_to '/backoffice'
      end
    # else
    #   flash[:notice] = "Opps sepertinya kamu belum verifikasi Captcha"
    #   redirect_to '/backoffice'
    # end
  end

  private
  


end
