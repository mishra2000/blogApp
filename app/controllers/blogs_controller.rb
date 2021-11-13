class BlogsController < ApplicationController
  def myblogs
    @articles = Article.all
  end

  
end
