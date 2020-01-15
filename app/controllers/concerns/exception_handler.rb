module ExceptionHandler
    extend ActiveSupport::Concern

    included do
        
        rescue_from ActiveRecord::RecordNotFound do |e|
            json_Response({ message: e.message}, :not_found)
        end 

    end


end
