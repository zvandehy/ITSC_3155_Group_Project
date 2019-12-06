require 'rails_helper.rb'

feature "Create Account" do
    scenario "User successfully navigates to the create account page" do
        visit root_path
        expect(page).to have_content "Create Account"
        click_link "Create Account"
        expect(page).to have_content "Name"
        expect(page).to have_content "Email"
        expect(page).to have_content "Password"
    end
    
    scenario "User successfully creates an account" do
        visit new_user_path
        expect(page).to have_content "Name"
        expect(page).to have_content "Email"
        expect(page).to have_content "Password"
        fill_in "Name", with: "John Smith"
        fill_in "Email", with: "jsmith@uncc.edu"
        fill_in "Password", with: "Password123"
        click_button "Create Account"
        expect(page).to have_content "John Smith"
    end
    
    scenario "User successfully out and back in" do
        visit new_user_path
        fill_in "Name", with: "John Smith"
        fill_in "Email", with: "jsmith@uncc.edu"
        fill_in "Password", with: "Password123"
        click_button "Create Account"
        click_link "Logout"
        expect(page).to have_content "Email"
        expect(page).to have_content "Password"
        fill_in "Email", with: "jsmith@uncc.edu"
        fill_in "Password", with: "Password123"
        click_button "Login"
        expect(page).to have_content "John Smith"
    end
end