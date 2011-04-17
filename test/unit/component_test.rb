require 'test_helper'

class ComponentTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Component.new.valid?
  end
end
