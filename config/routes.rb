ModuloPagamentos::Application.routes.draw do

  # página inicial
  root :to => 'welcome#index'
  #get "home/index"
   
  resources :diagramas  
 
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
