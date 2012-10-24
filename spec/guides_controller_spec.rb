# require 'spec_helper'

# describe GuidesController do
#   let(:guide) { Factory(:guide) }

#   it "should display an error message for a non-existing project" do
#     get :show, :id => "not-here"
#     response.should redirect_to(guides_path)
#     message = "The guide you were looking for could not be found."
#     flash[:alert].should eql(message)
#   end
# end