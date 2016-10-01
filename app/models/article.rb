# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Article < ActiveRecord::Base
  validates :title, presence: true, length: {minimum:3, maximum: 100}
  validates :description, presence: true, length: {minimum:10}
end
