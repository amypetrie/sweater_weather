require "rails_helper"

describe "A visitor goes to the root path in the browser" do
    it "sees a link to the GitHub repo" do
      visit "/"
      expect(page).to have_link "here"
    end
end
