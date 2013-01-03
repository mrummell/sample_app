require 'spec_helper'

describe "FriendlyForwradings" do
  
  it "should forward the requested page after signing in" do
  	user = FactoryGirl.create(:user)
  	visit edit_user_path(user)
  	#the test automatically follows the redirect to the signin page
  	fill_in :email,			:with => user.email
  	fill_in :password,		:with => user.password
  	click_button
  	#the test follows the redirect again, this time to users/edit
  	response.should render_template('users/edit')
  end
end
