class CreateShortUrls < ActiveRecord::Migration
  def change
    create_table :short_urls do |t|
      t.string :full_url
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
