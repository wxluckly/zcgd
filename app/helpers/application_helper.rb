module ApplicationHelper
  def categories(nodes, html='', num=1)
    nodes.each do |node|
      html += "<div class='checkbox #{'checkbox'+num.to_s}'><label><input id='ids_' name='ids[]' type='checkbox' value='#{node.id}'> <a href='/admin/areas/#{node.id}/edit'>#{node.name}</a></label></div>"
      if node.children.present?
        num1 = num + 1
        html = categories(node.children, html, num1)
      end
    end
    return html
  end
end
