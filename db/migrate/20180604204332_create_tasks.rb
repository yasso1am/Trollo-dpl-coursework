class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.text :body
      t.integer :priority
      t.belongs_to :list, foreign_key: true

      t.timestamps
    end
  end
end
