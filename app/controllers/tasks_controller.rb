class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update,:destroy]
  before_action :require_task

  Per=8

  def index
    if params[:name].present? && params[:status].present? 
      @tasks = Task.search_name_and_status(params).page(params[:page]).per(8)
    elsif params[:name].present?
      @tasks = Task.search_name(params).page(params[:page]).per(8)
    elsif params[:status].present? 
    @tasks = Task.search_status(params).page(params[:page]).per(8)
    elsif params[:sort_deadline]  == 'true'
      @tasks = Task.order(deadline: :desc).page(params[:page]).per(8)
    elsif params[:sort_priority] == 'true'
      @tasks = Task.order(priority: :asc).page(params[:page]).per(8)
    else
      @tasks = Task.order(created_at: :desc).page(params[:page]).per(8)
    end
    @tasks = Task.where(user_id: current_user.id).page(params[:page]).per(8)
  end
    # @task = @tasks.page(params[:page]).per(PER)


  def new
    @task = Task.new
  end
  
    def show
    end
  
    def edit
    end
  
  


    def create
      @task = current_user.tasks.build(task_params)
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
    #   @task = current_user.tasks.build(task_params)
    #   render :new if @task.invalid?
    # end
  
  
    
  private

  def task_params
    params.require(:task).permit(:name, :description, :priority, :deadline, :status, :page)
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def require_task
    unless logged_in?
      redirect_to new_session_path, notice: 'ログインしてください'
    end
  end
end