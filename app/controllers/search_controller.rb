class SearchController < ApplicationController

  def index
    render locals: {
      facade: SearchResultsFacade.new(params[:house])
    }
  end
end
