class TasksController < ApplicationController
    def index
        @tasks = Task.all()
        return json_response(@tasks)
    end

    def create
        @task = Task.create!(task_params)
        return json_response(@task, :created)     
    end

    private
    
    def task_params
        params.require(:tasks).permit(:name, :description, :done, :todo)
    end

end
