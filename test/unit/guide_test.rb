require 'test_helper'

class GuideTest < ActiveSupport::TestCase
  test "should not save guide without name" do
    guide = Guide.new
    assert !guide.save, "Saved the guide without a name"
  end
end
