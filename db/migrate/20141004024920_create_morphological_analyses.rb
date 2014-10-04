class CreateMorphologicalAnalyses < ActiveRecord::Migration
  def change
    create_table :morphological_analyses do |t|
      t.integer :sentence_id, null: false
      t.string  :surface,     null: false
      t.string  :reading
      t.string  :pos,         null: false
      t.string  :baseform
      t.timestamps
    end
    add_index :morphological_analyses, :sentence_id
    add_index :morphological_analyses, :pos
    add_index :morphological_analyses, :surface
  end
end
