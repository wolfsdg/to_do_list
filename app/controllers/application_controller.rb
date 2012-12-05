class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :control_check_cors
  after_filter :control_header_cors

  def control_header_cors
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Max-Age'] = "728000"
  end

  def control_check_cors
    if request.method == :options
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
      headers['Access-Control-Max-Age'] = "728000"
      render :text => '', :content_type => 'jasonp' 
    end
  end


end
