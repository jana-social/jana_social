class CreateEventUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :event_users do |t|
      t.references :users, null: false, foreign_key: true
      t.references :events, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
