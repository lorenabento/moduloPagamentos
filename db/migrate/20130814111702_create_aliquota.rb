class CreateAliquota < ActiveRecord::Migration
  def change
    create_table :aliquota do |t|
      t.float :empregador_perc
      t.float :empregado_perc
      t.datetime :ano_base
      t.boolean :ativa
      t.string :user_at

      t.timestamps
    end
  end
end
