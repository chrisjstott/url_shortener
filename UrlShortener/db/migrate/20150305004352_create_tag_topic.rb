class CreateTagTopic < ActiveRecord::Migration
  def change
    create_table :tag_topics do |t|
      t.string :topic

      t.timestamps
    end

    add_column(:shortened_urls, :tag_topic_id, :integer)

  end
end
