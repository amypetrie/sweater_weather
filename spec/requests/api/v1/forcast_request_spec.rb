require "rails_helper"

xdescribe "GET /api/v1/forecast?location=denver,co" do

  it "returns forcast data" do

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
  end

end
