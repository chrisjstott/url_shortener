class TagTopic < ActiveRecord::Base
  has_many(
    :taggings,
    class_name: 'Tagging',
    primary_key: :id,
    foreign_key: :tag_topic_id
  )

  has_many(
    :shortened_urls,
    through: :taggings,
    source: :shortened_url
  )
end
