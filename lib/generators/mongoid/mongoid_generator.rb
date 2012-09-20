require File.join(File.dirname(__FILE__), '../test_unit/model_generator')
require File.join(File.dirname(__FILE__), '../base')

module NestedScaffold
  module Generators
    class MongoidGenerator < ::Rails::Generators::NamedBase
      include ::NestedScaffold::Base

      hook_for :test_framework, :in => 'nested_scaffold:model'

      def initialize(args, *options) #:nodoc:
        super
        
        association = "#{nested_parent_name}:references"
	args << association unless args.include? association
        args_for_mongoid = args.join(" ")
        args_for_mongoid.gsub!("#{nested_parent_name}/","") if args[0]
	generate "mongoid:model", "#{args_for_mongoid} #{options[0].join(" ") if options[0]}"
      end

      # add embeds_many_association to parent model
      def add_association
        if File.exist?(parent_file = File.join('app/models', "#{nested_parent_name}.rb"))
          inject_into_file parent_file, "  embeds_many :#{table_name}\n", :after => "Mongoid::Document\n"
        end
      end

    end
  end
end
