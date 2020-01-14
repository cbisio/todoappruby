class TodosController < ApplicationController
    def index
        render json: Todo.all , status: :ok
    end
end
