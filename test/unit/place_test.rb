require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  test "should not save place without name" do
    place = Place.new
    assert !place.save, "Saved the place without a name"
  end
end
