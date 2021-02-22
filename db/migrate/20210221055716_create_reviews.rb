class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.belongs_to :profile
      t.belongs_to :escaperoom
      t.timestamps
    end
  end
end
