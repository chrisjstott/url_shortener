class ShortenedUrl < ActiveRecord::Base
  validates :submitter_id, :short_url, :long_url, presence: true
  validates :short_url, uniqueness: true

  belongs_to(
    :submitter,
    class_name: 'User',
    primary_key: :id,
    foreign_key: :submitter_id
  )

  has_many(
    :visits,
    class_name: 'Visit',
    primary_key: :id,
    foreign_key: :url_id
  )

  has_many(
    :visitors,
    through: :visits,
    source: :user
  )

  def self.create_for_user_and_long_url!(user, long_url)
    short_url = ShortenedUrl.random_code
    ShortenedUrl.create!(submitter_id: user.id, long_url: long_url, short_url: short_url)
  end

  def self.random_code
    while true
      random_url = SecureRandom.urlsafe_base64
      return random_url unless ShortenedUrl.exists?(short_url: random_url)
    end
  end

  def num_clicks
    Visit.where("url_id = ?", id).count
  end

  def num_uniques
    Visit.select(:user_id).distinct.count
  end

  def num_recent_uniques(time = 10.minutes.ago)
    Visit.select(:user_id).distinct.where()

end
