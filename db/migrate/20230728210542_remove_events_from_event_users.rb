class RemoveEventsFromEventUsers < ActiveRecord::Migration[7.0]
  def change
    remove_reference :event_users, :events, null: false, foreign_key: true
  end
end
