class JwtService

    SECRET_KEY = Rails.application.secrets.secret_key_base
    def self.encode(payload)
        payload + [exp:121212]
        
        JWT.encode(payload,SECRET_KEY )
        
    end

    def self.decode(token)
        result = JWT.decode(token, SECRET_KEY)[0]
        HashWithIndifferentAccess.new result
    rescue JWT::DecodeError => e
        print e.message
    end

end
