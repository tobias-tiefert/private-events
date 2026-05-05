class ChangeInvitationResponseDefault < ActiveRecord::Migration[8.1]
  def change
    change_column_default :invitations, :response, from: 0, to: 1
  end
end
