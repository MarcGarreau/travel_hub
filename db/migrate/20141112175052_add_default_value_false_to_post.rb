class AddDefaultValueFalseToPost < ActiveRecord::Migration
  def change
    change_column_default :posts, :hide,  false
  end
end
