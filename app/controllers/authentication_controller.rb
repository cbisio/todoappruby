class AuthenticationController < ApplicationController



    def login
    
            
         @user = User.find_by(params[:email])
         print @user.password
         
         if @user && @user.authenticate('pass')
                     json_response(token: "añlfjñajñlajñlfjs")    
        else
             Logger.error "No existe usuario"       
         end
       
        
    end

end
