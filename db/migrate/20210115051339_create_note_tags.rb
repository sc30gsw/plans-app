class CreateNoteTags < ActiveRecord::Migration[6.0]
  def change
    create_table :note_tags do |t|

      t.timestamps
    end
  end
end
