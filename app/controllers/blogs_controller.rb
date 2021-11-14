class BlogsController < ApplicationController
  def myblogs
    @articles = Article.all.order("created_at DESC")
  end


end
