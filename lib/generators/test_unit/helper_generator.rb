require 'rails/generators/test_unit/helper/helper_generator'
require File.join(File.dirname(__FILE__), '../base')

module NestedScaffold
  module Generators
    module Helper
      class TestUnitGenerator < ::TestUnit::Generators::HelperGenerator
        include ::NestedScaffold::Base

        source_root superclass.source_root
      end
    end
  end
end
