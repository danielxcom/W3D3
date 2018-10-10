
class Visit < ApplicationRecord
  belongs_to :users,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: 'User'

  belongs_to :shortened_urls,
    foreign_key: :short_id,
    primary_key: :id,
    class_name: 'ShortenedUrl'


  def self.record_visit!(user, shortened_url)
    Visit.create!(user_id: user.id, short_id: shortened_url.id)
  end

end
