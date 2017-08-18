
#require 'support/factory_girl'
require 'rails_helper'

#RSpec.describe User, type: :model do
describe User do
	
	context "Testing user view" do
		it "New user" do
			visit '/users/new'
			
			within("#new_user") do
				fill_in 'Name', :with => "Junior"
				fill_in 'Email', :with => "junior@hotmail.com"
			end

			click_button 'Create User'
			expect(page).to have_content 'User was successfully created'
		end
	end

	context "Verify user name" do
		it "User name is empty" do
			user = User.new
			user.name = "Junior"
			user.email = "junior@hotmail.com"
			
			expect(user.valid?).to be_truthy
		end
	end

	context "Verify local address" do
		user = FactoryGirl.create(:user, name: "Junior1", email: "junior@hotmail.com")
    	
		it "Local address is empty" do
			local = Local.new
			local.address = "Rua do Compositor"
			local.user_id = user.id
			
			expect(local.valid?).to be_truthy
		end
	end

	context "Verify local user" do
		user = FactoryGirl.create(:user, name: "Junior2", email: "junior@hotmail.com")

		it "Should have an user" do
			local = Local.new
			local.address = "Rua do Compositor"
			local.user_id = user.id
			
			expect(local.valid?).to be_truthy
		end
	end

	context "Verify users addresses" do		
		user = FactoryGirl.create(:user, name: "Junior3", email: "junior@hotmail.com")
    	local = FactoryGirl.create(:local, address: "Rua das Rosas1", user_id: 1)
    	local = FactoryGirl.create(:local, address: "Rua das Rosas2", user_id: 2)
    	local = FactoryGirl.create(:local, address: "Rua das Rosas3", user_id: 3)
    	local = FactoryGirl.create(:local, address: "Rua das Rosas4", user_id: 3)

    	idsUser = User.ids
    	idsUserLocal = Local.uniq.pluck(:user_id)

	    it "Should have at least one address" do
	    	expect(idsUserLocal).to eq(idsUser)
	    end
	end
end
