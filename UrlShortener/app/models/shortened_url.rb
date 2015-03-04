class ShortenedUrl < ActiveRecord::Base
  validates :submitter_id, :short_url, :long_url, presence: true
  validates :short_url, uniqueness: true

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
end
