# coding: utf-8


puts 'Alíquotas...'
Aliquotum.create(:empregador_perc => '2.0', :empregado_perc => '1.0', :ano_base => '2012-01-01', :ativa => '1')
Aliquotum.create(:empregador_perc => '3.0', :empregado_perc => '2.0', :ano_base => '2013-01-01', :ativa => '0')
