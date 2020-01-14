require 'rails_helper'

RSpec.describe 'Todo Api request', type: :request do
    ## Arrange test data
    let!(:todos){create_list(:todo, 5)}

    describe 'GET /todos' do
        before { get '/todos'}
        
        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end

        it 'return not empty' do
            expect(json).not_to be_empty
        end

        it 'return 5 todos' do
            expect(json.size).to eq(5)
        end 
    end
end