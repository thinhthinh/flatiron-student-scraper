class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :url
      t.string :email
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
