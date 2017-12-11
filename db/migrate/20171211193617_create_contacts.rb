class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :company
      t.string :department
      t.string :title
      t.string :email
      t.string :phone
      t.text :description
      t.belongs_to :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
