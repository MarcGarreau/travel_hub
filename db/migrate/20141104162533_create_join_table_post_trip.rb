class CreateJoinTablePostTrip < ActiveRecord::Migration
  def change
    create_join_table :posts, :trips do |t|
      t.index [:post_id, :trip_id]
      t.index [:trip_id, :post_id]
    end
  end
end
