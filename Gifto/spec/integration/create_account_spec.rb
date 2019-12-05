require 'rails_helper.rb'

feature "Create Account" do
    scenario "User successfully creates an account from the homepage" do
        visit root_path
        expect(page).to have_content "Create Account"
        click_link "Create Account"
        expect(page).to have_content "Name"
        expect(page).to have_content "Email"
        expect(page).to have_content "Password"
        fill_in "Name", with: "John Smith"
        fill_in "Email", with: "jsmith@uncc.edu"
        fill_in "Password", with: "Password123"
        click_button "Create Account"
        expect(page).to have_content "John Smith"
    end
end