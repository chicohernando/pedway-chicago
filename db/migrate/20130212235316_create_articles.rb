class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.references :location

      t.timestamps
    end
    add_index :articles, :location_id
  end
end
