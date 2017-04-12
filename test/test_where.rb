require 'test/unit'
require 'passive_record'

class User < PassiveRecord::Table
  attr_accessor :id, :name
end

class TestWhere < Test::Unit::TestCase
  def test_where
    assert_equal 1, User.where(name: 'Alice').size
    assert_equal 'Alice', User.where(name: 'Alice').first.name
  end
end
