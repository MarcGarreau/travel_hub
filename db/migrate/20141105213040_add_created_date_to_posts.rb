class AddCreatedDateToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :created_date, :date
  end
end
