class AddPasswordToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :has_secure_password, :string
  end
end
