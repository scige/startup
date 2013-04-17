class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :status, :default => ARTICLE_STATUS_ON
      t.integer :raw_id
      t.integer :category
      t.string :title
      t.string :content
      t.string :thumb
      t.integer :thumb_width
      t.integer :thumb_height
      t.string :image
      t.integer :like_count
      t.integer :click_count

      t.timestamps
    end
  end
end
