class TasksController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  before_action :correct_user, only: [:show, :destroy, :edit, :update]
  
  def index
    if logged_in?
      @tasks = current_user.tasks.order('created_at DESC').page(params[:page]).per(3)
    end
  end
  
  def show
    # @task = Task.find(params[:id])
    # @task = current_user.tasks.find_by(params[:id])
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:success] = 'Taskが正常に登録されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Taskが投稿できませんでした'
      render :new
    end
  end
  
  def edit
    # @task = Task.find(params[:id])
    # @task = current_user.tasks.find_by(params[:id])
  end
  
  def update
    # @task = Task.find(params[:id])
    # @task = current_user.tasks.find_by(params[:id])
    
    if @task.update(task_params)
      flash[:success] = 'Taskは正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Taskは更新できませんでした'
      render :edit
    end
  end
  
  def destroy
    # @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = 'Taskは正常に削除されました'
    redirect_to tasks_url
  end
  
  private

  #strong parameter
  def task_params
   params.require(:task).permit(:content, :status)
  end
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end

end