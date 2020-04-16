require "rails_helper"

RSpec.describe "Health Status EndPoint", type: :request do
    #Arrange
    describe "GET /health" do
        #Action
        before { get '/health'}
        #Asseveration
        it "should returnstatus code 200"    do
            expect(response).to have_http_status(200)
        end
    end
end