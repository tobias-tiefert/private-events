class UpdateEventsVisibility < ActiveRecord::Migration[8.1]
  def change
    Event.find_each do |event|
      event.update(visibility: 1)
    end
  end
end
