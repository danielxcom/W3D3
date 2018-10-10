# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :email, presence: true

  has_many :submitted_urls,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: 'ShortenedUrl'

  has_many :visited_urls,
    foreign_key: :short_id,
    primary_key: :id,
    class_name: 'Visit'



end
