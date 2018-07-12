class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  if Rails.env.production?
    rescue_from Exception, with: :rescue500
    rescue_from ActiveRecord::RecordNotFound,     with: :rescue403
    rescue_from ActionController::RoutingError,   with: :rescue404
  end

  def routing_error
    raise ActionController::RoutingError.new(params[:path])
  end

  def show_backtrace
    flash.now[:alert] = @exception.message
    Rails.logger.error @exception
    Rails.logger.debug @exception.backtrace.join("\n")
  end

  def rescue401(e)
    @exception = e
    render status: 401, template: '/errors/401'
    show_backtrace
  end

  def rescue403(e)
    @exception = e
    if request.xhr?
      render json: { error: '403 error' }, status: 403
    else
      render status: 403, template: '/errors/403'
    end
    show_backtrace
  end

  def rescue404(e)
    @exception = e
    if request.xhr?
      render json: { error: '404 error' }, status: 404
    else
      render status: 404, template: '/errors/404'
    end
    show_backtrace
  end

  def rescue500(e)
    @exception = e
    if request.xhr?
      render json: { error: '500 error' }, status: 500
    else
      render status: 500, template: '/errors/500'
    end
    show_backtrace
  end

end
