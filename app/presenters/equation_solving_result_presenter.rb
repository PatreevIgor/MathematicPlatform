class EquationSolvingResultPresenter
  def present(result)
    html_block = result.first

    if result[-1].is_a?(Array)
      [html_block, html_result_for_two_roots(result)]
    elsif !convert_to_i(result[-1]).nil?
      [html_block, html_result_for_one_root(result)]
    else
      [html_block, result[-1]]
    end
  end

  private

  def html_result_for_two_roots(result)
    "<span class='oms_formula'>X1</span>&nbsp;=&nbsp;" + result[-1].first.to_s +
      "<br><span class='oms_formula'>X2</span>&nbsp;=&nbsp;" + result[-1].last.to_s
  end

  def html_result_for_one_root(result)
    "<span class='oms_formula'>X</span>&nbsp;=&nbsp;" + result[-1].to_s
  end

  def convert_to_i(str)
    Integer(str)
  rescue ArgumentError
    nil
  end
end
