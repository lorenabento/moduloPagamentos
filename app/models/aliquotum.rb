class Aliquotum < ActiveRecord::Base
  attr_accessible :ativa
  attr_accessible :ano_base, :empregado_perc, :empregador_perc, :user_at


  #validates :ano_base, presence: true, uniqueness: true

end
