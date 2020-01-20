require 'rails_helper'

RSpec.describe 'Authentication', type: :request do

    describe 'POST /auth/login' do
        

        context 'When auth request is valid' do
            let!(:user) {create(:user)}
            let(:credentials) do
                {
                    email: user.email,
                    password: user.password
                }
            
            end


            it 'return status code 200' do
                
         
                                    
                post '/auth/login', params: credentials
                expect(response).to have_http_status(200)
            end
            it 'returns  token' do
                 post '/auth/login', params: credentials
                expect(json['token']).not_to be_nil
            end
        end
    end
end
