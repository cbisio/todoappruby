class TasksController < ApplicationController
    def index
        @tasks = Task.all()
        return json_response(@tasks)
    end

    def create
        @Todo = Todo.find(params[:todo_id])
        return json_response(@Todo.tasks.create!(task_params), :created)
    end

    def show
        @task = Task.find(params[:id])
        @todo = Todo.find(@task.todo_id)
        if verify_user_token(@todo) == true
            return json_response(@task)
        end
    end

    private
    
    def task_params
        params.require(:tasks).permit(:name, :description, :done)
    end

end
