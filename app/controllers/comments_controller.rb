class CommentsController < ApplicationController

  before_action :set_quote
  before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    @comment = @quote.comments.new
  end

  def create
    @comment = @quote.comments.new(comment_params)

    if @comment.save
      respond_to do |format|
        format.html { redirect_to quotes_path, notice: "Comment was successfully created." }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to quotes_path, notice: "Comment was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to quotes_path, notice: "Comment was successfully destroyed." }
      format.turbo_stream
    end
  end

  private

    def set_quote
      @quote = Quote.find(params[:quote_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end
