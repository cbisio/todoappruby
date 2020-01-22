class AuthService
    
    def initialize(headers = {})
        @headers = headers
    end

    def call
        {
            user: user
        }
    end

    attr_reader :headers

   def user
    
    @token = JwtService.decode(http_auth_header)

   end

   
    def http_auth_header
        
        if @headers['Authorization'].present?
            return @headers['Authorization'].split(' ').last
        end

        raise(ExceptionHandler::MissingToken, "Missing Token")
    end
end