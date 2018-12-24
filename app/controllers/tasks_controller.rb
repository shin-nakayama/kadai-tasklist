class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = Task.all
  end
  
  def show
    set_task
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:succes] = 'Task が正常に作成されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task は作成されませんでした'
      render :new
    end
  end
  
  def edit
    set_task
  end
  
  def update
    set_task
    
    if @task.update(task_params)
      flash[:succes] ='Task が正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task は更新されませんでした'
      render :new
    end
  end
  
  def destroy
    set_task
    @task.destroy
    
    flash[:succes] = 'Task が正常に削除されました'
    redirect_to tasks_url
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:content, :title)
  end
end

