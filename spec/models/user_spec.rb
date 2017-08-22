require 'rails_helper'

describe User do

	context "When user's name is empty" do
		it do
			user = User.new
			user.name = "Junior"
			user.email = "junior@hotmail.com"

			expect(user.valid?).to be_truthy
		end
	end

	context "When verifying user's local" do
		it "Should have at least one" do
			user = User.new
			expect(user.valid?).to_not be_truthy
			expect(user.errors[:local].size).to eq(1)
		end
	end
end
