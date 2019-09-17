Given("I am on the {capture_string}{optional_string}{optional_string}{capture_string}") do |capture_string, optional_string, optional_string2, capture_string2|
  visit admin_only_user_profile_edit_path(@user)
end

Then("I should navigate to {capture_string}") do |capture_string|
  visit admin_only_become_user_path(@user)
end

Then("I click {capture_string}") do |capture_string|
  visit admin_only_user_profile_edit_path(@user)
end

Then(/^I should see "([^"]*)" page$/) do |arg|
  visit edit_user_registration_path(@user)
end

Then("I focus on {capture_string}{optional_string}") do |capture_string, optional_string|
  find('#currentPassword').evaluate_script("$('#currentPassword').focus()")
end

Then("I should see the text {capture_string}") do |capture_string|
  expect(page).to have_selector 'h5', text: "Ange ditt administratörslösenord"
end