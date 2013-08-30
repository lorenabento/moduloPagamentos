class PagamentoController < ApplicationController
  
  #variavel global - opção de projeto
  $opselect = 1

  def index
	@pagamento = Pagamento.find :all 
	@aliquotas = Aliquotum.find :all
	@projects = Project.find :all
  
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pagamento }
    end
	
  end


  # GET /exemplos/1
  # GET /exemplos/1.json
  def show
    @pagamento = Pagamento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pagamento }
    end
  end

  # DELETE /exemplos/1.json
  def destroy
    @pagamento = Pagamento.find(params[:id])
    @pagamento.destroy
    
    respond_to do |format|
      format.html { redirect_to pagamento_url }
      format.json { head :no_content }
    end
  end


  # GET /exemplos/1
  # GET /exemplos/1.json
  def salvar
    @pagamento = Pagamento.find(params[:id])
    # valores recebidos por parâmetro
    @pagamento.id_transacao_moip = params[:idmoip]
    @pagamento.data_pag_moip = params[:datapag]
    @pagamento.data_pag_inss = params[:datapaginss]
    # seta os valores
    @pagamento.update_attributes(params[:pagamento])

    respond_to do |format|
      format.html { redirect_to action: :index }
    end
  end


  def pesquisarprojeto
   #registro com o id do projeto selecionado
   @project = Project.find(params[:idproject])

   $opselect = @project.id

   respond_to do |format|
      format.html { redirect_to action: :index }
    end
  end


  def calcular
    # alíquota ativa
    @aliquota = Aliquotum.find_all_by_ativa(true)

    	@aliquota.each do |aliq|
           @empregado_perc = aliq.empregado_perc
           @empregador_perc = aliq.empregador_perc	
           @ali_anobase = aliq.ano_base	
	end

    # id do pagamento a ser calculado
    @pagamento = Pagamento.find(params[:id])
    
    # cálculos dos valores referentes ao inss ativo
    @inss_autonomo = @pagamento.valor_transacao * @empregado_perc/100
    @inss_base2 = @pagamento.valor_transacao * @empregador_perc/100

    @pagamento.inss_autonomo = @inss_autonomo
    @pagamento.inss_base2 = @inss_base2
    
    # valor total
    @pagamento.valor_total = @pagamento.valor_transacao + @pagamento.inss_autonomo + @pagamento.inss_base2

    # ano base do cálculo
    @pagamento.ano_base_aliq = @ali_anobase    

    # seta os valores
    @pagamento.update_attributes(params[:pagamento])

    respond_to do |format|
      format.html { redirect_to action: :index }
    end

  end # fim calcular


end
