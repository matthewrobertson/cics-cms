class RenameUserPasswordColumn < ActiveRecord::Migration
  def up
    rename_column :users, :pass_hash, :password_digest
  end

  def down
    rename_column :users, :password_digest, :pass_hash
  end
end
