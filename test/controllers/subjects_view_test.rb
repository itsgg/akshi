require 'test_helper'

class SubjectsViewTest < ActionDispatch::IntegrationTest

  test 'index' do
    get subjects_url
    assert_select '.subject', 2
    assert_select '.subject' do
      assert_select '.card-header-title'
      assert_select '.card-content > .content'
    end
  end

end
