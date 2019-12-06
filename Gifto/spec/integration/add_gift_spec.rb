require 'rails_helper.rb'

feature "Create wishlist" do
    scenario "User adds gift to list" do
        visit new_user_path
        fill_in "Name", with: "John Smith"
        fill_in "Email", with: "jsmith@uncc.edu"
        fill_in "Password", with: "Password123"
        click_button "Create Account"
        click_button "Create Gift"
        expect(page).to have_content "Edit Gift"
        expect(page).to have_content "Delete Gift"
    end
    
    scenario "User sees other user's wishlist" do
        visit new_user_path
        fill_in "Name", with: "John Smith"
        fill_in "Email", with: "jsmith@uncc.edu"
        fill_in "Password", with: "Password123"
        click_button "Create Account"
        click_button "Create Gift"
        click_link "Logout"
        click_link "Create Account"
        fill_in "Name", with: "Jane Smith"
        fill_in "Email", with: "jsmit2@uncc.edu"
        fill_in "Password", with: "Password321"
        click_button "Create Account"
        click_link "Friends"
        click_link "View"
        expect(page).to have_content "Promise Gift"
    end
end