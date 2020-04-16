require 'rails_helper'

RSpec.describe 'User', type: :request do
 
    payload= 
    {
        name: "name",
        email: "prueba@prueba.com",
        password: "pass"
    }

   

    describe 'POST /SIGNUP' do
        context 'when request signup is valid' do
            before { post '/signup', params: payload }
   
            it 'create new user' do
                expect(response).to have_http_status(201)
            end   
            it 'return token jwt' do
                expect(json['token']).not_to be_nil
            end

        end
    end

end