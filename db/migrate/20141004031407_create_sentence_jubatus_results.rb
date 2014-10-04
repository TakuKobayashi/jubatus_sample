class CreateSentenceJubatusResults < ActiveRecord::Migration
  def change
    create_table :sentence_jubatus_results do |t|
      t.integer :sentence_id, null: false
      t.string  :type, null: false
      t.string  :label
      t.float   :score, null: false, default: 0
      t.timestamps
    end
    add_index :sentence_jubatus_results, :sentence_id
    add_index :sentence_jubatus_results, :type
    add_index :sentence_jubatus_results, :score
  end
end
