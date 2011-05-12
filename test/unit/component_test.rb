require 'test_helper'

class velociraptorTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert velociraptor.new.valid?
  end
end
