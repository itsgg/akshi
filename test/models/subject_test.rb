# == Schema Information
#
# Table name: subjects
#
#  id          :bigint(8)        not null, primary key
#  content     :text             not null
#  description :string           not null
#  order       :integer          default(0), not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  parent_id   :integer
#

require 'test_helper'

class SubjectTest < ActiveSupport::TestCase

  test 'title is required' do
    subject = Subject.new description: 'Test description', content: 'Test content'
    refute subject.valid?
    assert_not_nil subject.errors[:title], 'title validation failed'
  end

  test 'description is required' do
    subject = Subject.new title: 'Test', content: 'Test content'
    refute subject.valid?
    assert_not_nil subject.errors[:description], 'description validation failed'
  end

  test 'content is required' do
    subject = Subject.new title: 'Test', description: 'Test description'
    refute subject.valid?
    assert_not_nil subject.errors[:content], 'content validation failed'
  end

  test 'parent' do
    assert_equal subjects(:programming_ruby).parent, subjects(:programming)
  end

  test 'children' do
    assert_equal subjects(:programming).children.size, 2
  end

  test 'root' do
    assert_equal Subject.root.size, 2
  end

end
