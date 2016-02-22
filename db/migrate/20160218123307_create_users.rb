class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.integer :vkontakte_id
      t.string :access_token
      t.timestamps
    end
  end
end
