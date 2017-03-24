module ApplicationHelper

  def ApplicationHelper.yesNoNA2text(value)
    case value
    when 1
      return "Sim"
    when 2
      return "Não"
    else
      return "NA"
    end
  end

  def yesNoNAselect(model, property, selected)
    select model, property, options_for_select([['NA', '0'], ['Sim', '1'], ['Não', '2']], selected), {}, { :class => 'form-control' }
  end

end
