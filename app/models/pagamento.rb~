class Pagamento < ActiveRecord::Base    	
attr_accessible :users_id
attr_accessible :projects_id
attr_accessible :id_transacao_moip
attr_accessible :valor_transacao
attr_accessible :data_pag_moip
attr_accessible :data_pag_inss

has_one :users
has_one :projects
			validates_presence_of :id_transacao_moip, :valor_transacao, :data_pag_moip, :inss_base2, :inss_autonomo, :data_pag_inss
end

class Aliquotum < ActiveRecord::Base
  attr_accessible :ativa
  attr_accessible :ano_base
  attr_accessible :empregado_perc
  attr_accessible :empregador_perc
  attr_accessible :user_at
end
