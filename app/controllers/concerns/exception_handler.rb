module ExceptionHandler
    extend ActiveSupport::Concern

    class MissingToken < StandardError; end
    class InvalidToken < StandardError; end
    class AuthenticationError <StandardError; end
    class UserAlreadyExists <StandardError; end




    included do

        rescue_from ExceptionHandler::UserAlreadyExists, with: :UserAlreadyExists
        rescue_from ExceptionHandler::MissingToken, with: :unauthorized
        rescue_from ExceptionHandler::InvalidToken, with: :unauthorized
        rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized
        rescue_from ActiveRecord::RecordNotFound do |e|
            json_response({ message: e.message}, :not_found)
        end 

    end

    def unauthorized(e)
        json_response({message: e.message}, :unauthorized)
    end

    def UserAlreadyExists(e)
        json_response({message: e.message}, :conflict)
    end
end
