class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :en_name
      t.string :cn_name
      t.integer :parent_id, :default => 0

      t.timestamps
    end
  end
end
