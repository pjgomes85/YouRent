class RemoveFullnameFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :fullname, :string
  end
end
