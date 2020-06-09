class CommentsController < ApplicationController
  before_action :set_task, only: [:create, :edit, :update, :destroy]
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @comment = @task.comments.create(comment_params)
    @comment.save
    redirect_to task_path(@task)
  end

  def edit
  end

  def update
    @comment.update(comment_params)

    redirect_to task_path(@task)
  end

  def destroy
    @comment.destroy
    
    redirect_to task_path(@task)
  end

  private
    def comment_params
      params.require(:comment).permit(:description_content)
    end

    def set_task
      @task = Task.find(params[:task_id])
    end

    def set_comment
      @comment = @task.comments.find(params[:id])
    end
end
