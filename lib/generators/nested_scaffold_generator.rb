require 'rails/generators/rails/scaffold/scaffold_generator'
require File.join(File.dirname(__FILE__), 'base')
require File.join(File.dirname(__FILE__), 'scaffold_controller/scaffold_controller_generator')
require File.join(File.dirname(__FILE__), 'active_record/active_record_generator')

module NestedScaffold
  module Generators
    class NestedScaffoldGenerator < ::Rails::Generators::ScaffoldGenerator
      include ::NestedScaffold::Base

      # override ScaffoldGenerator
      hook_for :scaffold_controller, required: true

      # Ensure assets get created with the correct name
      hook_for :assets, in: :rails do |source, generator|
        source.invoke generator, [ source.file_name.pluralize ]
      end

      # override ModelGenerator
      hook_for :orm, required: true

      # replacing hook for adding config/routes
      remove_hook_for :resource_route
      # override
      def add_resource_route
        return if options[:actions].present?
        route_config = "resources :#{plural_nested_parent_name} do\n" \
                       "  resources :#{file_name.pluralize}\n" \
                       "end\n"
        route route_config

        gsub_file 'config/routes.rb', / *resources :#{plural_nested_parent_name}\n/, ''
      end
    end
  end
end
