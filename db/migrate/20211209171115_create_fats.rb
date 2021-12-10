class CreateFats < ActiveRecord::Migration[6.0]
  def change
    create_table :fats do |t|
      t.float       :weight,   null: false
      t.float       :body_fat, null: false
      t.references  :user,     null: false, foreign_ket: true

      t.timestamps
    end
  end
end
