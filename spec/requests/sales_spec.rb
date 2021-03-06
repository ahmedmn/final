require 'rails_helper'

RSpec.describe "Sales", :type => :request do
  describe "GET /sales" do
    it "works! (now write some real specs)" do
      get sales_path
      expect(response).to have_http_status(200)
    end

    it "should filter" do
	visit "/sales"
   	uncheck 'cities_Mansoura'
        #Initially all should be checked. So now unchecking one.
    	click_button "Filter"
        expect(page).not_to have_selector("td", :text => "Mansoura")
 	expect(page).to have_selector("td", :text => "Alex")
	expect(page).to have_selector("td", :text => "Cairo")
	expect(page).to have_selector("td", :text => "Aswan")
        
	uncheck 'cities_Aswan'
	uncheck 'cities_Alex'
	uncheck 'cities_Cairo'
	click_button "Filter"
	
	expect(page).not_to have_selector("td", :text => "Mansoura")
 	expect(page).not_to have_selector("td", :text => "Alex")
	expect(page).not_to have_selector("td", :text => "Cairo")
	expect(page).not_to have_selector("td", :text => "Aswan")
        
    end
  end
end
