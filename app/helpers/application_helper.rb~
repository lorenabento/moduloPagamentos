module ApplicationHelper

  def link_to_image(image_path, target_link,options={})
    link_to(image_tag(image_path, :border => "0"), target_link, options)
  end


  #Retorna "Sim" ou "Não" se o campo do registro é 1 ou 0 
  def yes_or_no?(value)
    value ? "Sim" : "Nao"
  end
 

  def data_formatada(data)
    if !data.nil?
      data.strftime("%d-%m-%Y")
    end
  end



  #teste
  def valor_formatado(number)
    number_to_currency number,
    unit: "R$",
    separator: ",",
    delimiter: "."
  end


  def flash_message
    messages = ""
    [:notice, :info, :warning, :error].each {|type|
      if flash[type]
        messages += "<p class=\"#{type}\">#{flash[type]}</p>"
      end
    }

     messages.html_safe
  end



end
