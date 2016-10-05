class ApplicationController < ActionController::Base

  rescue_from ActionController::RoutingError, with: -> { render_404  }
  rescue_from ActionController::UnknownController, with: -> { render_404  }
  rescue_from ActiveRecord::RecordNotFound, with: -> { render_404  }

  def render_404
    respond_to do |format|
      format.html { render('errors/error404', status: 404) }
      format.all  { render(nothing: true, status: 404) }
    end
  end

  def not_found
    fail ActionController::RoutingError.new('Not Found')
  end

  def redirect_to(*args)
    flash.keep
    super

  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def sanitize(params)
    ActionController::Base.helpers.sanitize(params)
  end

  include PublicActivity::StoreController
  hide_action :current_user

  def gibbon
    @gibbon ||= Gibbon::Request.new
  end
end
