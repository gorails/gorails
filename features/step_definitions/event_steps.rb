Before do |scenario|
  case scenario.name
  when "List events in JSON"
    FactoryGirl.create(:event)
  end
end

When(/^I send and accept JSON$/) do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'  
end

When(/^I send a GET request to "([^"]*)"$/) do |path|
  get path
end

Then(/^the response status should be "([^"]*)"$/) do |status|  
  expect(last_response.status).to eq status.to_i
end

Then(/^the JSON response should be:$/) do |json|      
  expect(JSON.parse(last_response.body)).to eq JSON.parse(json)   
end
