require 'http'
require 'parser'

class PagesController < ActionController::API
  def initialize
    super
    @parser = Parser.new self, self
  end

  def get url
    HTTP.get(url).to_s
  end

  def save content
    p = Page.new(content)
    {saved: p.save, page: p}
  end

  def index
    render json: Page.all
  end

  def create
    result = @parser.parse page_params[:url]
    if result[:saved]
      render json: result[:page], status: :created, location: '/pages'
    else
      render json: result[:page].errors, status: :unprocessable_entry
    end
  end

  private
    def page_params
      params.permit('url')
    end
end
