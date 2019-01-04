require "rails_helper"

describe "GET /api/v1/forecast?location=denver,co" do

  it "returns forcast data" do
    get '/api/v1/forecast?location=denver,co'

    response_back = JSON.parse(response.body)
    binding.pry
    expect(response).to be_successful
  end

end
