class Pagamento < ActiveRecord::Base    

attr_accessible :id	
attr_accessible :users_id	 
attr_accessible :projects_id	 
attr_accessible :releases_id	 
attr_accessible :id_transacao_moip	 
attr_accessible :valor	
attr_accessible :valor_transacao	
attr_accessible :inss_base2	
attr_accessible :inss_autonomo	
attr_accessible :data_pag_moip	
attr_accessible :data_pag_inss	 
attr_accessible :ano_base_aliq	 
attr_accessible :created_at	 
attr_accessible :updated_at	 

end


