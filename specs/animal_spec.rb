require("minitest/autorun")
require("minitest/rg")

require_relative("../models/animal.rb")
require_relative("../models/owner.rb")

class Animal_Test < MiniTest::Test

  def test_adopt_status_is_boolean
    status = 't'
    assert_equal("True", @animal.status_to_b(status))
  end

  def test_adopt_status_is_boolean
    status = 'f'
    assert_equal("False", @animal.status_to_b(status))
  end

end
