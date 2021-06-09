class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false, default: ''
      t.string :skills, array: true, default: []
      t.string :phone_number
      t.belongs_to :resume

      t.timestamps
    end
  end
end
