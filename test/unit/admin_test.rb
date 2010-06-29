require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  
  subject {Admin.make}
  should_validate_uniqueness_of :user_name
  should_validate_presence_of :user_name
end
