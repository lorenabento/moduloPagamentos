ModuloPagamentos::Application.routes.draw do

  # página inicial
  get "home/index"
  
 
  resources :pagamento do
    member do
      get 'calcular'
      get 'salvar'
      get 'pesquisarprojeto'
    end
  end
    
  resources :aliquota do
    member do
      get 'ativar'
      get 'excluir'
      get 'inserir'
      get 'salvar'
    end
  end

   resources :cvalores do
    member do
      get 'popular'
    end
  end

end
