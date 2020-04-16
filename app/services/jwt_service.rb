class JwtService

    SECRET_KEY = Rails.application.secrets.secret_key_base
    def self.encode(payload)
        payload + [exp:121212]
        @jwt = JWT.encode(payload,SECRET_KEY )
        return "Bearer #{@jwt}" 
        
    end

    def self.decode(token)
        return  JWT.decode(token, SECRET_KEY)[0]
    rescue JWT::DecodeError => e
        raise ExceptionHandler::InvalidToken, e.message
    end

end
