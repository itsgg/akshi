require 'test_helper'

class SubjectsControllerTest < ActionDispatch::IntegrationTest

  test 'index' do
    get subjects_url
    assert_response :success
  end

end
