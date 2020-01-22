class ApplicationController < ActionController::API
    include Response , ExceptionHandler, TokenHandler

before_action :auth_request





private
def auth_request
    @user  = (AuthService.new(request.headers).call)[:user]
end

end
