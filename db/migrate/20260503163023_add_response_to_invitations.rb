class AddResponseToInvitations < ActiveRecord::Migration[8.1]
  def change
    add_column :invitations, :response, :integer, default: 0
    Invitation.find_each do |invitation|
      invitation.update(response: 1)
    end
  end
end
