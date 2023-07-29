class AddUserToEventUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :event_users, :user, null: false, foreign_key: true
  end
end
