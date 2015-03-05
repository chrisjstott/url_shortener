class Tagging < ActiveRecord::Base
  validates :tag_topic_id, :shortened_url_id, presence: true

  def self.tag_url(shortened_url, tag_topic)
    Tagging.create!(shortened_url_id: shortened_url.id, tag_topic_id: tag_topic.id)
  end

  belongs_to(
    :tag_topic,
    class_name: 'TagTopic',
    primary_key: :id,
    foreign_key: :tag_topic_id
  )

  belongs_to(
    :shortened_url,
    class_name: 'ShortenedUrl',
    primary_key: :id,
    foreign_key: :shortened_url_id
  )

end
