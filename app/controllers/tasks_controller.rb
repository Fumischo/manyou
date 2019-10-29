class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update,:destroy]
  def index
    # @tasks = Task.all.page(params[:page])
    # @q = Task.ransack(params[:q])
    # @tasks = @q.result(distinct: true)
    if params[:sort_deadline]  == 'true'
      @tasks = Task.all.order(deadline: :desc)
    elsif params[:sort_priority] == 'true'
      @tasks = Task.all.order(priority: :asc)
    elsif params[:name]
      @tasks = Task.task(params)
    else
      @tasks = Task.all.order(created_at: :desc)
    end
  end



  def show
  end


  def new
    @task = Task.new
  end

  def edit
  end


  def create
    @task = Task.new(task_params)
    if params[:back]
      render :new
    else
      if @task.save
        redirect_to root_path, notice: "登録完了"
      else
      render :new
      end
    end
  end

    
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
    redirect_to tasks_path, notice: "更新完了"
    else 
      render :edit
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: "削除完了"
  end

  # def confirm
  #   @task= Task.new(task_params)
  #   render :new if @task.invalid?
  # end


    
  private

  def task_params
    params.require(:task).permit(:name, :description, :priority, :deadline, :search, :status,:priority)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end



