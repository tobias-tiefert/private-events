class AddNewDefaultToEvents < ActiveRecord::Migration[8.1]
 def change
    change_column_default :events, :visibility, 0
 end
end
