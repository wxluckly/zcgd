class Area < ActiveRecord::Base
  has_ancestry

  def self.sellect_list
    result = []
    roots.each do |node|
      result << [node.depth_title, node.id]
      result = node.serialize_siblings(result)
    end
    result
  end

  # public instance methods ...................................................
  def serialize_siblings(array=[self])
    children.order("ancestry").each do |obj|
      array << [obj.depth_title, obj.id]
      obj.serialize_siblings(array)
    end
    array
  end

  def depth_title
    "#{'--' * depth}#{name}"
  end
end
