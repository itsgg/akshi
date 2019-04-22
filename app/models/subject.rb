# == Schema Information
#
# Table name: subjects
#
#  id          :bigint(8)        not null, primary key
#  description :string           not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  parent_id   :integer
#

class Subject < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  belongs_to :parent, class_name: 'Subject'
  has_many :children, class_name: 'Subject', foreign_key: 'parent_id'
end
