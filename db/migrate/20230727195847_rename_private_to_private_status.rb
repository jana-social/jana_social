class RenamePrivateToPrivateStatus < ActiveRecord::Migration[7.0]
  def change
    rename_column :events, :private, :private_status
  end
end
