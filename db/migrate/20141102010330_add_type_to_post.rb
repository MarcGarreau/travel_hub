class AddTypeToPost < ActiveRecord::Migration
  def change
    add_column :posts, :source, :string
    add_column :posts, :source_id, :string
  end
end
