require 'rails_helper'

RSpec.describe 'Authentication', type: :request do

    describe 'POST /auth/login' do
        

        context 'When auth request is valid' do
            let!(:user) {create(:user)}
       
         
            it 'return status code 200' do

                payload= 
                    {
                    email: user.email,
                    password_digest: user.password_digest
                }.to_json
                post '/auth/login', params: payload
                expect(response).to have_http_status(200)
            end
            it 'returns  token' do

                payload= 
                    {
                    email: user.email,
                    password_digest: user.password_digest
                }.to_json
                 post '/auth/login', params: payload
                expect(json['token']).not_to be_nil
            end
        end
    end
end
