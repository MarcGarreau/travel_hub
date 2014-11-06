class CreateTravelings < ActiveRecord::Migration
  def change
    create_table :travelings do |t|
      t.references :user, index: true
      t.references :trip, index: true
      t.timestamps
    end
  end
end
