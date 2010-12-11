require 'rails/generators/test_unit/model/model_generator'
require File.join(File.dirname(__FILE__), '../base')

module NestedScaffold
  module Generators
    module Model
      class TestUnitGenerator < ::TestUnit::Generators::ModelGenerator
        include ::NestedScaffold::Base

        source_root superclass.source_root
      end
    end
  end
end
