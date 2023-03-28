class CommentsController < ApplicationController

    before_action :set_comment, only: [:edit, :update, :destroy]

    before_action :authenticate_user!

    before_action :currect_user
    def new
        @article = Article.find(params[:article_id])
        @comment = @article.comments.build

    end
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        @comment.user = current_user
        @comment.save

        respond_to do |format|
            format.turbo_stream
            format.html {redirect_to article_path(@article), notice: "Comment was successfully created"}
            format.json { head :no_content }
        end

    end

    def edit
    end

    def update

        if @comment.update(comment_params)
      
            respond_to do |format|
                format.html {redirect_to article_path(@article.id)}
                format.json { head :no_content }
            end   
        end

    end

    def destroy

        if @comment.destroy

            respond_to do |format|
                format.turbo_stream
                format.html { redirect_to article_path(@article.id)}
                format.json { head :no_content }
            end
        end
    end

    private

    def set_comment
        @article = Article.find(params[:article_id])
        @comment = Comment.find(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:title, :body)
    end

    def currect_user
        @comment = Comment.find_by(id: params[:id])
        unless current_user.id == @comment.user.id
          redirect_to articles_path, alert: "You are not authorized to perform this action"
        end
      end
end
