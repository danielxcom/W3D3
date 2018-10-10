# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer          not null
#  long_url   :string           not null
#  short_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortenedUrl < ApplicationRecord

  belongs_to :submitter,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: 'User'

  has_many :visitors,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: 'Visit'

# go outside, get User.first.shortened_url
  def self.random_code
    a = SecureRandom.urlsafe_base64
    if ShortenedUrl.exists?(a)
      self.random_code
    else
      return a
    end
  end

  def self.make(user_object, url)
    ShortenedUrl.create!(user_id: user_object.id, long_url: url, short_url: ShortenedUrl.random_code)
  end

  def num_clicks
    self.count
  end

  def num_uniques
  end

  def num_recent_uniques
  end

end
