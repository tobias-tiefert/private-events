class AddForeignKeyToInvitations < ActiveRecord::Migration[8.1]
  def change
    add_foreign_key :events, :users, column: :host_id
  end
end
