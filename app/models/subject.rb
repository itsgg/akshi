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

class Subject < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
end
