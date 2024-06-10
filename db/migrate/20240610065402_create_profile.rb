class CreateProfile < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: true, foreign_key: true
      t.string :sex
      t.date :dob

      t.timestamps
    end
  end
end
