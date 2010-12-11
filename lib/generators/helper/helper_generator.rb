require 'rails/generators/rails/helper/helper_generator'
require File.join(File.dirname(__FILE__), '../test_unit/helper_generator')
require File.join(File.dirname(__FILE__), '../base')

module NestedScaffold
  module Generators
    class HelperGenerator < ::Rails::Generators::HelperGenerator
      include ::NestedScaffold::Base

      source_root superclass.source_root

      # override
      hook_for :test_framework, :in => 'nested_scaffold:helper'
    end
  end
end
