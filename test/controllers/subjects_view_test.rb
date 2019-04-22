require 'test_helper'

class SubjectsViewTest < ActionDispatch::IntegrationTest

  test 'index' do
    get subjects_url
    assert_select '.subject-card', 2
    assert_select '.subject-card' do
      assert_select '.card-header-title'
      assert_select '.card-content > .content'
    end
  end

  test 'pagination' do
    skip 'test that pagination is shown only when pages > 1'
  end

end
