class CreateActs < ActiveRecord::Migration[6.0]
  def change
    create_table :acts do |t|
      t.integer :num, null: false, unique: true
      t.text    :choice, null: false
      t.integer :ans, null: false
      t.references :rubigon, null: false, foreign_key: true
    end
  end
end
