# == Schema Information
#
# Table name: subjects
#
#  id          :bigint(8)        not null, primary key
#  description :string           not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class SubjectTest < ActiveSupport::TestCase

  test 'title is required' do
    subject = Subject.new description: 'Test description'
    refute subject.valid?
    assert_not_nil subject.errors[:title], 'title validation failed'
  end

  test 'description is required' do
    subject = Subject.new title: 'Test'
    refute subject.valid?
    assert_not_nil subject.errors[:description], 'description validation failed'
  end

end
