class CvaloresController < ApplicationController



 def index
   @issues = Issue.find :all
   @releases = Release.find :all
   @projects = Project.find :all
   @users = User.find :all
   @pagamentos = Pagamento.find :all
 
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pagamentos }
    end
	
  end

  # gera os dados da tabela base
  # 1. processar todos os registros salvos na tabela: issues
  def popular  
    @total = 0.0
    @valor = 0.0
    # qtd de registros na tabela issues
    @qtdIssues = Issue.count
    for i in 1..@qtdIssues do
      # verifica se existe na tabela registro com id = i - evitar erro
      if(Issue.where(id: i).blank?)
        break
      end	
      
      @issues = Issue.find(i)
      # pega o id do user 
      @idUser = @issues.author_id
      # pega a release referente
      @idRelease = @issues.release_id
        
      @pags = Pagamento.find_all_by_users_id(@issues.author_id)
      # pesquisa na tabela pagamentos se já existe registro com mesmo id
      if(@pags.count == 0)
        # não existe registro
        @valor = valorBug(@issues.type_id)            
             
        if(@issues.status_id == 5) # aprovada
          # adiciona registro do usuário na tabela pagamentos
          @pagteste02 = Pagamento.new
          @pagteste02.users_id = @issues.author_id
	  @pagteste02.release_id = @issues.release_id
          @pagteste02.valor_transacao = @valor
          @pagteste02.valor_total = @valor
          # pesquisa o id do projeto pela release 
          @projID = Release.find(@issues.release_id)
          @pagteste02.projects_id = @projID.project_id
          @pagteste02.update_attributes(params[:pagteste02]) 
	end # fim end
          else
            # existe usuário
	    @flagR = false# true: existe usuário com mesma release corrente
                          # false: existe registro de usuário, mas não existe registro relacionado a release corrente 
            @pags.each do |pags|
              if(pags.release_id == @issues.release_id)
                 @flagR = true
                   break
              end
           end
           #flagR: false, grava novo registro na tabela
             if(@flagR == false)
               if(@issues.status_id == 5) # aprovada 
                 @pagteste02 = Pagamento.new
                 @pagteste02.users_id = @issues.author_id
	         @pagteste02.release_id = @issues.release_id
                 @pagteste02.valor_transacao = valorBug(@issues.type_id)
                 @pagteste02.valor_total = valorBug(@issues.type_id)
                 # pesquisa o id do projeto pela release 
                 @projID = Release.find(@issues.release_id)
                 @pagteste02.projects_id = @projID.project_id
                 # seta os valores
                 @pagteste02.update_attributes(params[:pagteste02])
                end
               #flagR: true, faz a soma dos valores das releases
              else 
                #encontra o usuario com o id procurado e a mesma release
                @pags = Pagamento.find_all_by_users_id(@issues.author_id)
                @pags.each do |pags|
                    
                if(pags.release_id == @issues.release_id and @issues.status_id == 5)
                  @typeBug = @issues.type_id
                  @valor = valorBug(@issues.type_id)
                  pags.valor_total = pags.valor_total + @valor
                  pags.valor_transacao = pags.valor_transacao + @valor
                  pags.update_attributes(params[:pags])
                end # fim if
              end #fim loop  
                  
            end #fim if      
	 end #fim if         
       end #fim for	

       respond_to do |format|
         format.html { redirect_to action: :index }
       end
  end #fim popular


  # retorna o valor do bug
  def valorBug(typeBug)
    @typeBug = typeBug
    valor = 0
    if(@typeBug == 1)
      valor = 4.0
    elsif(@typeBug == 2)
      valor = 2.50
    elsif(@typeBug == 3) 
      valor = 10.0
    elsif(@typeBug == 4)
      valor = 10.0
    elsif(@typeBug == 5)
      valor = 20.0
    elsif(@typeBug == 6)
      valor = 20.0
    elsif(@typeBug == 7)
      valor = 1.0
    end
    valor # retorna o valor da variável
  end

end
