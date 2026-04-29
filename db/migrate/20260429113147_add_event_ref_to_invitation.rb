class AddEventRefToInvitation < ActiveRecord::Migration[8.1]
  def change
    add_reference :invitations, :event, null: false, foreign_key: true
  end
end
