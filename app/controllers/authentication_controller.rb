class AuthenticationController < ApplicationController



    def login
    
            
         @user = User.find_by(email:params[:email])
         print @user.password
         
         if @user && @user.authenticate(params[:password])
            @token = JwtService::encode([user_id:@user.id,name:@user.name])        
            json_response(token: @token)    
        else
             #Logger.error "No existe usuario"       
         end
       
        
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
