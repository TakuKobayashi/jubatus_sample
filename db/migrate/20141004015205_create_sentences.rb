class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.integer :user_id, null: false
      t.string  :type, null: false
      t.text    :text
      t.boolean :analyzed, default: false
      t.timestamps
    end
    add_index :sentences, :user_id
    add_index :sentences, :type
    add_index :sentences, :analyzed
  end
end
