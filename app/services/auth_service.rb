class AuthService
    def http_auth_header
        
        if headers['Authorization'].present?
            return headers['Authorization'].split(' ').last
        end

    end
end