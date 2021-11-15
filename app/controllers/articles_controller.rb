class ArticlesController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show]
  before_action :correct_user, only: [:edit,:update,:destroy]

  def myblogs
    @articles = Article.all
  end
  def index
    @articles = Article.all.order("created_at DESC").paginate(page: params[:page], per_page: 3)

  end
  def show
    @article = Article.find(params[:id])
  end
  def new
    # @article = Article.new
    @article = current_user.articles.build
  end
  def create
    # @article = Article.new(article_params)
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end
  def edit
    # @article = Article.find(params[:id])
    @article = current_user.articles.find(params[:id])
  end
  def update
    # @article = Article.find(params[:id])
    @article = current_user.articles.find(params[:id])
    if @article.user_id.to_s==article_params["user_id"].to_s && @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
  def correct_user
    @article = current_user.articles.find_by(id: params[:id])
    redirect_to articles_path,notice: "not authorised" if @article.nil?
  end
  private
    def article_params
      params.require(:article).permit(:title,:body,:user_id)
    end
end
