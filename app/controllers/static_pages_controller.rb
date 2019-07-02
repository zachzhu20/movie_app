class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @movie  = current_user.movies.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
  
  def intro
    respond_to do |format|
      format.js
    end
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end
