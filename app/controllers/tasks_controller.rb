class TasksController < ApplicationController
  def index
    @tasks = Task.where({"user_id" => session["user_id"]})
    @current_user = User.find_by({"id" => session["user_id"]})
  end

  def create
    @task = Task.new
    @task["description"] = params["description"]
    @task["user_id"] = session["user_id"]
    @task.save
    redirect_to "/tasks"
  end

  def destroy
    @task = Task.find_by({ "id" => params["id"] })
    @task.destroy
    redirect_to "/tasks"
  end
end
