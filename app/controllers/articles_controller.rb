class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :only_current_user, only: [:edit, :update, :destroy]


  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def show

  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.create(article_params)
    
    if @article.save
      flash[:notice] = "Article was created successfully"
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
   #  TODO: add a confirmation dialog
   #  TODO: verify key constraint with comment
  
    @article.destroy

    flash[:notice] = "the article was deleted successfully"
    redirect_to articles_path, status: :see_other
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :body, category_ids: [])
    end

    def only_current_user
      @article = Article.find_by(id: params[:id])
      unless current_user.id == @article.user.id || current_user.admin?
        redirect_to articles_path, alert: "You are not authorized to perform this action"
      end
    end
end
