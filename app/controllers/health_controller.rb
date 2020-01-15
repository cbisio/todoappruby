class HealthController < ApplicationController

    def health
        json_response({api:'OK'})
       
    end
end