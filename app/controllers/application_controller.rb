class ApplicationController < ActionController::API
    include Response , ExceptionHandler

before_action :auth_request


private
def auth_request
    render json: "Existe cabecera", status: :ok
end

end
