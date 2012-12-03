class CreateSearchIndex < ActiveRecord::Migration
  def change
    add_index :products, :title
    # TODO: 使用全部的内容字段建立索引进行搜索
    #add_index :products, [:title, :address, :content], :name=>"search_index"
  end
end
