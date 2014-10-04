class CreateMorphologicalAnalyses < ActiveRecord::Migration
  def change
    create_table :morphological_analyses do |t|
      t.integer :sentence_id, null: false
      t.string  :surface,     null: false
      t.string  :reading,     null: false
      t.string  :pos,         null: false
      t.string  :baseform,    null: false
      t.timestamps
    end
    add_index :morphological_analyses, :sentence_id
    add_index :morphological_analyses, :pos
    add_index :morphological_analyses, :baseform
  end
end
