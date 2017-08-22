require 'rails_helper'

describe Local do

	context "When local's address is empty" do
		it do
			user = FactoryGirl.create(:user, name: "Junior1", email: "junior@hotmail.com")

			local = Local.new
			local.address = "Rua do Compositor"
			local.user_id = user.id

			expect(local.valid?).to be_truthy
		end
	end

	context "When verifying local's user" do
		user = FactoryGirl.create(:user, name: "Junior2", email: "junior@hotmail.com")

		it "Should have an user" do
			local = Local.new
			local.address = "Rua do Compositor"
			local.user_id = user.id

			expect(local.valid?).to be_truthy
		end
	end
end
