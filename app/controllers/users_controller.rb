class UsersController < ApplicationController

    skip_before_action :auth_request, only: :create 
        def create
            user = User.create!(user_params)
            token = JwtService::encode([user_id: user.id, name: user.name,iss: "badi.com" ])
            json_response({
                token: token
            }, :created)
        end

        private
        def user_params
            params.permit(
                :name,
                :email,
                :password
            )
        end


end
