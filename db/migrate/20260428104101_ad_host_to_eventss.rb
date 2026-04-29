class AdHostToEventss < ActiveRecord::Migration[8.1]
  def change
    add_reference :events, :host
  end
end
