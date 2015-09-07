class Hash
  def delete_recursive(to_remove)
    delete(to_remove)
    each_value do |value|
      value.delete_recursive(to_remove) if value.is_a? Hash
      value.each { |h| h.delete_recursive(to_remove) if h.is_a? Hash } if value.is_a? Array
    end
  end
end

