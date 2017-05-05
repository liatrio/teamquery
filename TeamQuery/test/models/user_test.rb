require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'Valid User' do
    user = User.new(name: 'John', email: 'john@example.com', password_digest: 'pass')
    assert user.valid?
  end

  test 'Invalid Without password_digest' do
    user = User.new(email: 'john@example.com', name: 'John')
    refute user.valid?
    assert_not_nil user.errors[:password_digest]
  end
end
