class HtmlGeneratorPresenter
  def present(result)
    if result.is_a?(Array)
      "<span class='oms_formula'>X1</span>&nbsp;=&nbsp;" + result.first.to_s +
        "<br><span class='oms_formula'>X2</span>&nbsp;=&nbsp;" + result.last.to_s
    elsif !convert_to_i(result).nil?
      "<span class='oms_formula'>X</span>&nbsp;=&nbsp;" + result.to_s
    else
      result
    end
  end

  private

  def convert_to_i(str)
    Integer(str)
  rescue ArgumentError
    nil
  end
end
