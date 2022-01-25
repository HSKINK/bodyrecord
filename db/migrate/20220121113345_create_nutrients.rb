class CreateNutrients < ActiveRecord::Migration[6.0]
  def change
    create_table :nutrients do |t|
      t.float      :protein,       null: false
      t.float      :fat,           null: false
      t.float      :carbohydrate,  null: false
      t.float      :goal_body_fat, null: false
      t.references :body,          null: false, foreign_ket: true
      t.timestamps
    end
  end
end
