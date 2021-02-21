class CreateEscapeRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :escape_rooms do |t|
      t.string :title
      t.string :location
      t.string :difficulty 
      t.text :description  
      t.datetime :hours
      t.timestamps
    end
  end
end
