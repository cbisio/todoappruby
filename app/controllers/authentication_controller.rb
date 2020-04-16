class AuthenticationController < ApplicationController

    skip_before_action :auth_request, only: :login 
    
    def login
    
            
         @user = User.find_by(email:params[:email])
                
         if @user && @user.authenticate(params[:password])
            @token = JwtService::encode([user_id:@user.id,name:@user.name])        
            return json_response(token: @token)    
         end
         
         raise(ExceptionHandler::AuthenticationError, "Email o Password Incorrect")
    end

    private
        def user_params
            params.permit(
                :name,
                :email,
                :password
            )
        end
end
