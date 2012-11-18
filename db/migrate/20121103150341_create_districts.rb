class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :en_name
      t.string :cn_name
      t.integer :parent_id, :default => 0

      t.timestamps
    end
  end
end
