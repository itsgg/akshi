require 'test_helper'

class RoutesTest < ActionDispatch::IntegrationTest

  test 'root' do
    assert_generates '/', controller: 'subjects', action: 'index'
  end

end
