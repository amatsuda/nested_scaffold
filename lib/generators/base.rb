module NestedScaffold
  module Base
    protected
    def nested_parent_name
      @class_path.join('/')
    end

    def nested_parent_id
      "#{nested_parent_name}_id"
    end

    def nested_parent_class_name
      nested_parent_name.classify
    end

    def plural_nested_parent_name
      nested_parent_name.pluralize
    end

    def class_path
      []
    end

    def regular_class_path
      []
    end

    def controller_class_path
      []
    end
  end
end
