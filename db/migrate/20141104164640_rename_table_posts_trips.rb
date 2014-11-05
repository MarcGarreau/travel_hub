class RenameTablePostsTrips < ActiveRecord::Migration
  def change
    rename_table :posts_trips, :travels
  end
end
