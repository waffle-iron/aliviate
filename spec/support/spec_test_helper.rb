require "spec_helper"
include Warden::Test::Helpers

module SpecTestHelper
  def create_logged_in_user
    user = create(:user)
    sign_in user
  end
end

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::ControllerHelpers, type: :view
  config.include SpecTestHelper, type: :controller
end
