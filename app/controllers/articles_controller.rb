class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :currect_user, only: [:edit, :update, :destroy]


  def index
    @articles = Article.all
  end

  def show

  end

  def new
    @article = current_user.article.build
  end

  def create
    @article = current_user.article.create(article_params)
    
    if @article.save
      flash[:notice] = "Article was created succesfully"
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
   
  end

  def update
   
    if @article.update(article_params)
      flash[:notice] = "Article was edited succesfully"
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  
    @article.destroy

    flash[:notice] = "the article was deleted successfully"
    redirect_to articles_path, status: :see_other
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :body)
    end

    def currect_user
      @article = Article.find_by(id: params[:id])
      unless current_user.id == @article.user.id
        redirect_to articles_path, alert: "You are not authorized to perform this action"
      end
    end
end
