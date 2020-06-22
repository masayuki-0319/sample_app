class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  rescue_from Application::NotPermittedError, with: :redirect_root_page

  def redirect_root_page(exception = nil)
    Rails.logger.info "ルート URL にリダイレクト: #{exception.message}" if exception

    redirect_to root_url, flash: { danger: "閲覧権限がありません" }
  end

  def hello
    render html: 'hello, world!'
  end

  private

    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
