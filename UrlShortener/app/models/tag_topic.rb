class TagTopic < ActiveRecord::Base
  has_many(
    :shortened_urls,
    class_name: 'Tagging',
    primary_key: :id,
    foreign_key: :tag_topic_id
  )
end
