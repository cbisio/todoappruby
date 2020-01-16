class AuthenticationController < ApplicationController



    def login
    
            
         @user = User.find_by(params[:email])
        if @user && @user.authenticate(params[:password])
                     json_response(token: "añlfjñajñlajñlfjs")    
        else
             Logger.error "No existe usuario"       
         end
       
        
    end

end
