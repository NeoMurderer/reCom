class MonileAuth < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :mobile_access_token, :string
  end
end
