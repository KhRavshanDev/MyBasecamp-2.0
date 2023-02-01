class CreateMsgs < ActiveRecord::Migration[7.0]
  def change
    create_table :msgs do |t|
      t.string :title
      t.text :body
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
