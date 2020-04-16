module TokenHandler
    def verify_user_token(todo)
        if(todo.user_id == @user[0]['user_id'])
            return true
        end
        raise ExceptionHandler::AuthenticationError,"You dont have acces"
    end
end
