class PagamentosController < ApplicationController
  

  def index
	@pagamentos = Pagamento.find :all
	@aliquotas = Aliquotum.find :all
	@projects = Project.find :all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pagamentos }
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

  # GET /exemplos/new
  # GET /exemplos/new.json
  def new
    @pagamento = Pagamento.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pagamento }
    end
  end

  # GET /exemplos/1/edit
  def edit
    @pagamento = Pagamento.find(params[:id])
  end

  # POST /exemplos
  # POST /exemplos.json
  def create
    @pagamento = Pagamento.new(params[:pagamento])

    respond_to do |format|
      if @Pagamento.save
        format.html { redirect_to @pagamento, notice: 'Exemplo was successfully created.' }
        format.json { render json: @pagamento, status: :created, location: @pagamento }
      else
        format.html { render action: "new" }
        format.json { render json: @pagamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /exemplos/1
  # PUT /exemplos/1.json
  def update
    @pagamento = Pagamento.find(params[:id])

    respond_to do |format|
      if @pagamento.update_attributes(params[:pagamento])
        format.html { redirect_to @pagamento, notice: 'Exemplo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pagamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exemplos/1.json
  def destroy
    @pagamento = Pagamento.find(params[:id])
    @pagamento.destroy
    
    respond_to do |format|
      format.html { redirect_to pagamentos_url }
      format.json { head :no_content }
    end
  end


  # GET /exemplos/1
  # GET /exemplos/1.json
  def salvar
    @pagamento = Pagamento.find(params[:id])

    @pagamento.id_transacao_moip = params[:idmoip]
    @pagamento.data_pag_moip = params[:datapag]
    @pagamento.data_pag_inss = params[:datapaginss]

    @pagamento.update_attributes(params[:pagamento])

    respond_to do |format|
      format.html { redirect_to action: :index }
    end
  end


  def calcular
    #aliquota ativa
    @aliquota = Aliquotum.find_all_by_ativa(true)
    @ali_anobase

    	@aliquota.each do |aliq|
           @empregado_perc = aliq.empregado_perc
           @empregador_perc = aliq.empregador_perc	
           @ali_anobase = aliq.ano_base	
	end

    #id do pagamento a ser calculado
    @pagamento = Pagamento.find(params[:id])
    
    if (@empregado_perc == 0 || @empregador_perc == 0)
      #erro
    end
    
    #
    @inss_autonomo = @pagamento.valor_transacao * @empregado_perc/100
    @inss_base2 = @pagamento.valor_transacao * @empregador_perc/100

    @pagamento.inss_autonomo = @inss_autonomo
    @pagamento.inss_base2 = @inss_base2
    #valor toral
    @pagamento.valor_total = @pagamento.valor_transacao + @pagamento.inss_autonomo + @pagamento.inss_base2

    #ano base do calculo
    @pagamento.ano_base_aliq = @ali_anobase    

    @pagamento.update_attributes(params[:pagamento])

    respond_to do |format|
      format.html { redirect_to action: :index }
    end
  end


end
