module AutoDemeter
  def children_names
    association_names=self.class.reflect_on_all_associations.find_all { |x| [:has_one, :belongs_to].include?(x.instance_variable_get("@macro")) }
    association_names.map { |x| x.instance_variable_get("@name").to_s } | association_names.map { |x| x.instance_variable_get("@name").to_s.gsub(/^#{self.class.name.underscore}_/, '') }
  end

  def reflected_children_regex
    Regexp.new("^(" << children_names.join('|') << ")_(.*[^=])$")
  end

  def method_missing(method_id, *args, &block)
    begin
      super
    rescue NoMethodError, NameError
      if match_data=method_id.to_s.match(reflected_children_regex)
        association_name=self.methods.include?(match_data[1].intern) ? match_data[1] : "#{self.class.name.underscore}_#{match_data[1]}"
        if association=send(association_name)
          association.send(match_data[2], *args, &block)
        else
          match_data[2][0..2] == 'is_' ? match_data[2][3..6] == 'not_' : nil
        end
      else
        raise
      end
    end
  end
end