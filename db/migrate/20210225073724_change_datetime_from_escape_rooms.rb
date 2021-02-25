class ChangeDatetimeFromEscapeRooms < ActiveRecord::Migration[6.1]
  def change
    change_column :escape_rooms, :hours, :string
  end
end
