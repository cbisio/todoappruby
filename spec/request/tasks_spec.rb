require 'rails_helper'

RSpec.describe 'Tasks Api request', type: :request do
    ## Arrange test data
    let!(:user){create(:user)}
    let!(:todo){create(:todo)}
    let!(:tasks){create_list(:task, 5)}
    let(:headers){valid_headers}

    describe 'GET /todos/1/tasks' do
        before { get '/todos/1/tasks', headers: headers}
        
        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end

        it 'return not empty' do
            expect(json).not_to be_empty
        end

        it 'return 5 tasks' do
            expect(json.size).to eq(5)
        end 
    end

    describe 'POST /todos/1/tasks' do
        
        context 'when the request is valid' do
            req_payload = {
                tasks: {  name: 'Superman', description:'xavi', done:true}
        }.to_json
            
            before { post '/todos/1/tasks', params:req_payload, headers: headers}
            it 'return status code 201' do
                expect(response).to have_http_status(201)
            end
            it 'return not empty' do
                expect(json).not_to be_empty
            end

            it 'return id = 6' do
                expect(json['id']).to eq(6)
            end
        end
        context 'when te request is invalid' do
            
            req_payload = {
                tasks: { name:'superman'}
            }.to_json
            before { post '/tasks', params:req_payload, headers:headers}
            it 'returns status code 422' do
                expect(response).to have_http_status(422)
            end
        end
    end

    describe 'GET /tasks /:id' do
        
        context 'when todo exist' do
            before { get '/tasks/1', headers:headers}
            it 'return statuscode = 200' do
                expect(response).to have_http_status(200)

            end
            it 'returns id = 1' do
                expect(json['id']).to eq(1)
            end
        end

        context 'when task  no exists' do
            before { get '/task/1000', headers:headers}
            it 'return statuscode = 404' do
                expect(response).to have_http_status(404)
            end
        end


    end

    def valid_headers
        {
            "Authorization" =>JwtService.encode([user_id:1]),
            "Content-Type"=>"application/json" 
        }
    end

end