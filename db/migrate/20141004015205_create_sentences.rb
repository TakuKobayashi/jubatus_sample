class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.string :type, null: false
      t.text   :text
      t.timestamps
    end
    add_index :sentences, :type
  end
end
