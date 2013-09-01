require 'test_helper'

class TilesRailsTest < ActiveSupport::TestCase

  test 'module is loaded' do
    assert_kind_of Module, Tiles::Rails
  end

end
