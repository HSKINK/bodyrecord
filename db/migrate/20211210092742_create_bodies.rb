class CreateBodies < ActiveRecord::Migration[6.0]
  def change
    create_table :bodies do |t|
      t.integer    :sex_id,       null: false
      t.integer    :age,          null: false
      t.integer    :height,       null: false
      t.integer    :nutrients_p,  null: false
      t.integer    :nutrients_f,  null: false
      t.integer    :nutrients_c,  null: false
      t.float      :goal_body_fat
      t.references :fat, null: false, foreign_ket: true
      t.timestamps
    end
  end
end
