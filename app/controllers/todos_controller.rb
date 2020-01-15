class TodosController < ApplicationController
    
    
    def index
        render json: Todo.all , status: :ok
    end

    def create
        render json: Todo.create(create_params), status:  :created
    end

    private
    def create_params
        params.require(:todo).permit(:title,:created_by)
    end
end
