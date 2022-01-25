class CreateBodies < ActiveRecord::Migration[6.0]
  def change
    create_table :bodies do |t|
      t.integer    :gender,null: false
      t.integer    :age,   null: false
      t.integer    :tall,  null: false
      t.references :user,  null: false, foreign_ket: true
      t.timestamps
    end
  end
end
