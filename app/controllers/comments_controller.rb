# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :require_logged_in, except: %i[index]
  before_action :find_comment, only: %i[edit update destroy]
  before_action :find_item, only: %i[index edit]

  def index
    @comments = @item.last_comments
    @comment = current_user.comments.build(item: @item)
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      flash[:success] = 'Comment successfully created'
      redirect_to item_comments_path(comment.item)
    else
      flash[:error] = 'Something went wrong'
      render 'index'
    end
  end

  def edit
    if belong_to_user?(@comment)
      @comments = @item.last_comments
      render 'index'
    else
      flash[:error] = "Sorry that item don't belong to you"
      redirect_to item_comments_path(@comment.item)
    end
  end

  def update
    if @comment.update_attributes(comment_params)
      flash[:success] = 'Comment was successfully updated'
      redirect_to item_comments_path(@comment.item)
    else
      flash[:error] = 'Something went wrong'
      render 'index'
    end
  end

  def destroy
    if @comment.destroy
      flash[:success] = 'Comment was successfully deleted.'
    else
      flash[:error] = 'Something went wrong'
    end
    redirect_to item_comments_path(@comment.item)
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment, :user_id, :item_id)
  end
end
