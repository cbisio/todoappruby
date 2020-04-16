class TodosController < ApplicationController
    
    include Response

    def index
        json_response(Todo.all)
    end

    def create
        json_response(Todo.create!(create_params),:created)
    end

    def show
        json_response(Todo.find(params[:id]))
    end

    private
    def create_params
        params.require(:todo).permit(:title,:created_by, :user_id)
    end
end
