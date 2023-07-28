class RemoveUsersFromEventUsers < ActiveRecord::Migration[7.0]
  def change
    remove_reference :event_users, :users, null: false, foreign_key: true
  end
end
