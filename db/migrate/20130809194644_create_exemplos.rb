class CreateExemplos < ActiveRecord::Migration
  def change
    create_table :exemplos do |t|
      t.string :nome
      t.integer :idade
      t.string :telefone
      t.datetime :datacadastro
      t.boolean :ativo
      t.string :logradouro
      t.string :cidade
      t.string :uf

      t.timestamps
    end
  end
end
