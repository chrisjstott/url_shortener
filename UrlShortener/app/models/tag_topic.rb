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

# TO DO: get this shit to work, maybe
  # def most_popular_links(n = 1)
  #   ShortenedUrl.select(:long_url).where('taggings.tag_topic_id = ?', id).group(shortened_urls.id).order((:long_url).count DESC)
  #
  #
  #
  #
  #   # db.execute(<<-SQL, id, n)
  #   #   SELECT
  #   #     *
  #   #   FROM
  #   #     shortened_urls
  #   #   JOIN
  #   #     taggings ON shortened_urls.id = taggings.shortened_url_id
  #   #   WHERE
  #   #     taggings.tag_topic_id = ?
  #   #   GROUP BY
  #   #     shortened_urls.id
  #   #   ORDER BY
  #   #     COUNT(*) DESC
  #   #   LIMIT
  #   #     ?
  #   # SQL
  # end
end
