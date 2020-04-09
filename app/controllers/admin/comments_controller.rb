# frozen_string_literal: true

module Admin
  class CommentsController < AdminController
    def index
      @comments = Comment.last_comments
    end
  end
end