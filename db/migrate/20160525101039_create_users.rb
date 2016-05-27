class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :types
      t.string :hobbies
      t.boolean :is_student
      t.boolean :is_tutor
      t.boolean :private
      t.date :dob
      t.attachment :avatar
      
      t.timestamp
    end
  end
end
