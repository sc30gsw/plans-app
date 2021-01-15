class CreateNoteTags < ActiveRecord::Migration[6.0]
  def change
    create_table :note_tags do |t|
      t.references :note, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
