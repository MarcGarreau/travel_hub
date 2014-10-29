class AddPropertiesToPost < ActiveRecord::Migration
  def change
    add_column :posts, :properties, :hstore
  end
end
