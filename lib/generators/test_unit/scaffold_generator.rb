require 'rails/generators/test_unit/scaffold/scaffold_generator'
require File.join(File.dirname(__FILE__), '../base')

module NestedScaffold
  module Generators
    module Scaffold
      class TestUnitGenerator < ::TestUnit::Generators::ScaffoldGenerator
        include ::NestedScaffold::Base

        source_root File.expand_path('../templates', __FILE__)
      end
    end
  end
end
