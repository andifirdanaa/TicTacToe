class Backoffice::HomeController < ApplicationController

  #kalo ada request xhr (ajax) dia template nya false
  layout proc{|c| c.request.xhr? ? false : "temp_bo" }
  before_action :check_session, :get_moduls
  skip_before_action :verify_authenticity_token
  require 'csv'


  def index
  
    # render json: session
    # return

  end

  def logout
    reset_session
    redirect_to '/backoffice/logins'
  end
end
