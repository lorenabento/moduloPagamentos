class DiagramasController < ApplicationController

  def index
    @diagrama = params[:id]
  end


end
