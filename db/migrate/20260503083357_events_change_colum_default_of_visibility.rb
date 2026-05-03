class EventsChangeColumDefaultOfVisibility < ActiveRecord::Migration[8.1]
  def change
    change_column_default :events, :visibility, from: nil, to: "private_event"
  end
end
