class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = Task.all.order('created_at DESC')
  end

  def new
    @task = Task.new
  end

  def show
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task, notice: 'Tarefa criada!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to @task
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: 'Deletado com sucesso!'
  end
  

  private
    def task_params
    params.require(:task).permit(:title, :description, comments_attributes: [:id, :description_content])
    end

    def set_task
      @task = Task.find(params[:id])
    end
  
end
