class AliquotaController < ApplicationController


  # GET /aliquota
  # GET /aliquota.json
  def index
    @aliquota = Aliquotum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @aliquota }
    end
  end

  # GET /aliquota/1
  # GET /aliquota/1.json
  def show
    @aliquotum = Aliquotum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @aliquotum }
    end
  end

 
  # GET /aliquota/1/edit
  def edit
    @aliquotum = Aliquotum.find(params[:id])
  end


  # PUT /aliquota/1
  # PUT /aliquota/1.json
  def update
    @aliquotum = Aliquotum.find(params[:id])

    respond_to do |format|
      if @aliquotum.update_attributes(params[:aliquotum])
        format.html { redirect_to @aliquotum, notice: 'Aliquotum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @aliquotum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aliquota/1
  # DELETE /aliquota/1.json
  def destroy
    @aliquotum = Aliquotum.find(params[:id])
    @aliquotum.destroy

    respond_to do |format|
      format.html { redirect_to aliquota_url }
      format.json { head :no_content }
    end
  end

  # SALVAR /aliquota/1
  # SALVAR /aliquota/1.json
  def salvar
    @aliquotum = Aliquotum.find(params[:id])
 
    @aliquotum.empregador_perc = params[:empregador_perc]
    @aliquotum.empregado_perc = params[:empregado_perc]
    @aliquotum.ano_base = params[:ano_base]

    @aliquotum.update_attributes(params[:aliquotum])

    respond_to do |format|
      format.html { redirect_to action: :index }
    end
  end

  def inserir
    #apenas insere se o último registro tiver todos os seus campos preenchidos
    @aliquotum = Aliquotum.last
    if(@aliquotum.empregado_perc.blank?)
	# não insere
    elsif(@aliquotum.empregador_perc.blank?)
	# não insere
    else
    	@aliquotum = Aliquotum.new

        #id do último registro
        @maxId = Aliquotum.last
        @maxId = @maxId.id 

        @aliquotum.id = @maxId+1
        @aliquotum.ativa = false

        @aliquotum.update_attributes(params[:aliquotum]) 
    end
     
    respond_to do |format|
       format.html { redirect_to action: :index }
    end
  end   



  def ativar   
    #ativar apenas se os campos: empregado_perc e empregador_perc estiverem preenchidos
    @aliquotum = Aliquotum.find(params[:id])
    if(@aliquotum.empregado_perc.blank?)
	# não ativa
    elsif(@aliquotum.empregador_perc.blank?)
	# não ativa
    else
        #qtd de registros
        @qtd = Aliquotum.count
        #última id válida
        @maxId = Aliquotum.last
        @maxId = @maxId.id    
        #seta o campo "ativo" de todos os registros para false
        for i in 1..@maxId do 
            #checa se o registro existe
            if(Aliquotum.where(id: i).blank?)
              
            else 
              @aliquotum = Aliquotum.find(i)
              @aliquotum.ativa = false
              @aliquotum.update_attributes(params[:aliquotum])
            end
        end
   
        #seta o campo: ativa do registro corrente
        @aliquotum = Aliquotum.find(params[:id])
        @aliquotum.ativa = true
        @aliquotum.update_attributes(params[:aliquotum])
    end
    respond_to do |format|
      format.html { redirect_to action: :index }
    end
  end



  def excluir
    @aliquotum = Aliquotum.find(params[:id])

    #deleta apenas se exister pelo menos dois registros
    if(Aliquotum.count >= 2)
      @aliquotum = Aliquotum.find(params[:id])
      @aliquotum.destroy
    else
        #???exibi mensagem na tela informando que é preciso ter ao menos um registro 
    end

    #garante que exista pelo menos um registro ativo 
    @maxId = Aliquotum.last #última id válida
    @aliquotum = Aliquotum.find(@maxId)
    @aliquotum.ativa = true
    @aliquotum.update_attributes(params[:aliquotum])

    respond_to do |format|
        format.html { redirect_to action: :index }
    end
  end

end
