class CreateShortenedUrls < ActiveRecord::Migration
  def change
    create_table :shortened_urls do |t|
      t.string :short_url, unique: true
      t.string :long_url
      t.integer :submitter_id
    end

    add_index :shortened_urls, [:submitter_id, :short_url]
  end
end
