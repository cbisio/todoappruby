class AuthenticationController < ApplicationController



    def login
    
            
         @user = User.find_by(params[:email])
         print @user.password
         
         if @user && @user.authenticate('pass')
            @token = JwtService::encode([user_id:@user.id,name:@user.name])        
            json_response(token: @token)    
        else
             Logger.error "No existe usuario"       
         end
       
        
    end

end
