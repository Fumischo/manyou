class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update,:destroy]
  before_action :involved_task
  before_action :gurantee_accurate_user, only: [:show]

  Per=8

  def index
    # @tasks = Task.where(user_id: current_user.id).page(params[:page]).per(8)
    # @task = @tasks.page(params[:page]).per(8)
    # @task = current_user.tasks
    # @tasks = Task.all
    @task = @current_user.tasks.where(user_id: @current_user.id)
    if params[:name].present? && params[:status].present? 
      @tasks = @task.search_name_and_status(params).page(params[:page]).per(8)
    elsif params[:name].present?
      @tasks = @task.search_name(params).page(params[:page]).per(8)
    elsif params[:status].present? 
      @tasks = @task.search_status(params).page(params[:page]).per(8)
    elsif params[:label_id].present?
      @tasks = current_user.tasks.search_label(params[:label_id]).page(params[:page]).per(8)
    elsif params[:sort_deadline]  == 'true'
      @tasks = @current_user.tasks.page(params[:page]).per(8).order(deadline: :desc)
    elsif params[:sort_priority] == 'true'
      @tasks = @current_user.tasks.page(params[:page]).per(8).order(priority: :asc)
    else
      @tasks = @current_user.tasks.page(params[:page]).per(8).order(created_at: :desc)
    end
    @tasks = @tasks.page(params[:page])
  end
    

  def new
    @task = Task.new
  end
  
  def show
  end
  
  def edit
  end
  
  def create
    @tasks = current_user.tasks.build(task_params)
      if params[:back]
        render :new
      else
        if @tasks.save
          redirect_to root_path, notice: "登録完了"
        else
        render :new
        end
      end
  end
  

    def update
      # @task = Task.find(params[:id])
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
      params.require(:task).permit(:id, :name, :description, :priority, :deadline, :status, :page, { label_ids: [] })
    end

  
    def set_task
      @task = Task.find(params[:id])
    end
  
    def involved_task
      unless logged_in?
        redirect_to new_session_path
        flash[:notice] = "ログインしてください"
      end
    end
  
    def gurantee_accurate_user
      if current_user.id != @task.user_id && current_user.admin
        redirect_to tasks_path
        flash[:notice] = "管理者権限がありません"
      end
    end
  end 