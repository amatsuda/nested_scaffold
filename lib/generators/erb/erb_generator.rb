require 'rails/generators/erb/scaffold/scaffold_generator'
require File.join(File.dirname(__FILE__), '../base')

module NestedScaffold
  module Generators
    class ErbGenerator < ::Erb::Generators::ScaffoldGenerator
      include ::NestedScaffold::Base

      source_root File.expand_path('../templates', __FILE__)
    end
  end
end
