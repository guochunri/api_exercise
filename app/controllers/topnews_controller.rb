class TopnewsController < ApplicationController
  def index
    @topnews = Topnews.all
  end
end
