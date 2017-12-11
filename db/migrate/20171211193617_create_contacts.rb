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
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
