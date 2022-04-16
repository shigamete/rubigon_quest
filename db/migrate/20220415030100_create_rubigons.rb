class CreateRubigons < ActiveRecord::Migration[6.0]
  def change
    create_table :rubigons do |t|
      t.integer :stage_no, null: false, unique: true
      t.text    :enemy, null: false
      t.timestamps
    end
  end
end
