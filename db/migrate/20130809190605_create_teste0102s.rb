class CreateTeste0102s < ActiveRecord::Migration
  def change
    create_table :teste0102s do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
