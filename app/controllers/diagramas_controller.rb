class DiagramasController < ApplicationController

  def index
    @diagrama = params[:id]
    if @diagrama == 1
      
      #link_to image_tag("DiagCadastroUsuário.jpg", :border => 0)
    elsif @diagrama == 2
      #link_to image_tag("DiagRegistroOcorrencias.jpg", :border => 0)
    elsif @diagrama == 3
      #link_to image_tag("", :border => 0)
    end

  end


end
