class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :title
      t.integer :priority, default: 0

      t.timestamps
    end
  end
end
