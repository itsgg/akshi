# == Schema Information
#
# Table name: subjects
#
#  id          :bigint(8)        not null, primary key
#  content     :text             not null
#  description :string           not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  parent_id   :integer
#

class Subject < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :content, presence: true

  belongs_to :parent, class_name: 'Subject', required: false
  has_many :children, class_name: 'Subject', foreign_key: 'parent_id', dependent: :destroy

  has_one_attached :image, dependent: :destroy

  scope :root, -> { where(parent_id: nil) }
end
