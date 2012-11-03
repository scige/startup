class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :en_name
      t.string :cn_name
      t.integer :parent_id

      t.timestamps
    end
  end
end
