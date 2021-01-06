class CreateMypages < ActiveRecord::Migration[6.0]
  def change
    create_table :mypages do |t|
      t.string :first_name
      t.string :last_name
      t.string :image
      t.text   :profile
      t.timestamps
    end
  end
end
