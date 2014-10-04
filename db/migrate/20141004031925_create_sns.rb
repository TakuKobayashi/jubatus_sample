class CreateSns < ActiveRecord::Migration
  def change
    create_table :sns do |t|
      t.string  :info_type, null: false
      t.string  :uid, null: false
      t.string  :token
      t.string  :token_secret
      t.timestamps
    end
    add_index :sns, :info_type
    add_index :sns, :uid
  end
end
