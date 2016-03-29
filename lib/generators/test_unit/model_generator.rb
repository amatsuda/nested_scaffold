require 'rails/generators/test_unit/model/model_generator'
require File.join(File.dirname(__FILE__), '../base')

module NestedScaffold
  module Generators
    module Model
      class TestUnitGenerator < ::TestUnit::Generators::ModelGenerator
        include ::NestedScaffold::Base

        source_root superclass.source_root

        def initialize(*)
          super

          unless attributes.map {|a| [a.name, a.type.to_s]}.include? [nested_parent_name, 'references']
            #DIRTY HACK add 'references' attribute
            attributes.insert 0, Rails::Generators::GeneratedAttribute.new(nested_parent_name, :references)
          end
        end
      end
    end
  end
end
