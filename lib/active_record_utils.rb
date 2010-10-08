module ActiveRecordUtils
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    def acts_as_permaurl(attribute_name, target_attribute_name)
      before_validation do |model|
        if model[attribute_name].nil? or model[attribute_name].empty?
          model[attribute_name] = create_permaurl(model[target_attribute_name]) unless model[target_attribute_name].nil? or model[target_attribute_name].empty?
        end
      end
    end

    def trim_fields(*field_list)
      before_validation do |model|
        field_list.each do |field|
          model[field] = model[field].strip if model[field].respond_to?(:strip)
        end
      end
    end

  private
    
    def create_permaurl(string)
      s = string
      s = s.gsub(" ", "_")
      s = s.gsub(/[^0-9a-zA-Z_]/, '')
      s = s.downcase
      return s
    end
  end
end