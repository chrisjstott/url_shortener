class CreateTaggingAndUpdateShortenedUrl < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :tag_topic_id
      t.integer :shortened_url_id

      t.timestamps
    end
    add_index :taggings, [:tag_topic_id, :shortened_url_id]
    add_index :tag_topics, [:topic]

    remove_column :shortened_urls, :tag_topic_id
  end
end
