class AddNameIndexToLocation < ActiveRecord::Migration
  def change
    add_index :locations, :name, :order => :asc
  end
end
