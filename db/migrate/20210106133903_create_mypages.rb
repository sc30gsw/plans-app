class CreateMypages < ActiveRecord::Migration[6.0]
  def change
    create_table :mypages do |t|
      t.string :first_name
      t.string :last_name
      t.string :image
      t.text   :profile
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
