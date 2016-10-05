# app/controllers/paginas_controller.rb
class PaginasController < ApplicationController

  before_filter :validate_page!, only: %i(show)

  # It renders only whitelisted pages
  def show
    render(page_path)
  end

  private

  def validate_page!
    not_found unless valid_page?
  end

  def valid_page?
    normalized_page_name.in?(configatron.static_pages.paginas)
  end

  def normalized_page_name
    @page_name ||= ActionController::Base.helpers.sanitize(params[:pagina].to_s)
  end

  def page_path
    "paginas/#{normalized_page_name}"
  end
end
