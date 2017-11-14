require 'minitest/autorun'
# require_relative 'dog'

class Cat
  attr_accessor :name, :purr_factor

  def initialize(name, purr_factor)
    @name = name
    @purr_factor = purr_factor
  end

  def miaow
    "#{name} is miaowing."
  end
end

class CatTest < MiniTest::Test
  def setup
    @kitty = Cat.new('Kitty', 4)
  end

  def test_is_cat; end

  def test_another
    assert_equal('Milo', @kitty.name)
  end

  def test_name
    assert_equal('Kitty', @kitty.name)
  end

  def test_miaow
    assert_includes(@kitty.miaow, ' is miaowing.')
  end

  def test_raises_error
    assert_raises(ArgumentError) do
      Cat.new
    end
  end

  def test_is_not_purrier
    patch = Cat.new('Patch', 5)
    milo = Cat.new('Milo', 3)
    refute(patch.purr_factor > milo.purr_factor)
  end

end
