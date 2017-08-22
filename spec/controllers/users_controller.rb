require 'rails_helper'

describe UsersController do
  context "When verifying nested-fields from users" do
    it do
      user = FactoryGirl.build(:user)
      user.locals.build(FactoryGirl.attributes_for(:local))
      post :create, :user => FactoryGirl.attributes_for(:user, :locals => [FactoryGirl.build(:local)])
    end
  end
end
