class HealthController < ApplicationController
    skip_before_action :auth_request, only: :health 
    def health
        json_response({api:'OK'})
       
    end
end