require('minitest/autorun')
require('minitest/rg')

require_relative('../models/animal.rb')
require_relative('../models/owner.rb')

class AnimalTest < MiniTest::Test
  def test_adopt_status_is_true
    status = 't'
    assert_equal('True', @animal.status_to_b(status))
  end

  def test_adopt_status_is_false
    status = 'f'
    assert_equal('False', @animal.status_to_b(status))
  end
end
