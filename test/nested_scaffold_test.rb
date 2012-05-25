require 'test_helper'
require 'generators/nested_scaffold_generator'
require 'generators/active_record/active_record_generator'
require 'rails/generators/rails/scaffold/scaffold_generator'
require 'rails/generators/test_unit/controller/controller_generator'

class NestedScaffoldTest < Rails::Generators::TestCase
  tests NestedScaffold::Generators::NestedScaffoldGenerator
  destination File.expand_path("../tmp", File.dirname(__FILE__))
  setup :prepare_destination
  setup :prepare_dummy_files
  
  Master = "box"
  Detail = "sweet"
  
  test "Assert all files are properly created" do

    res = "#{Master}/#{Detail}"
    out = run_generator %w(#{res}/sweet name:string quantity:integer notes:text --orm=active_record --test-framework=test_unit --migration=true --fixture)
    puts "\nOutput from generator:\n" + out

    #ls "app/assets/stylesheets"
    #ls "db/migrate"

    assert_file "app/controllers/#{Detail}s_controller.rb"
    assert_file "test/functional/#{Detail}s_controller_test.rb"
    assert_file "app/helpers/#{Detail}s_helper.rb"
    assert_file "app/assets/stylesheets/#{Detail}s.css"
    assert_file "app/assets/javascripts/#{Detail}s.js"
    
    assert_file "app/views/#{Detail}s/_form.html.erb"
    assert_file "app/views/#{Detail}s/index.html.erb"
    assert_file "app/views/#{Detail}s/show.html.erb"
    assert_file "app/views/#{Detail}s/new.html.erb"
    assert_file "app/views/#{Detail}s/edit.html.erb"
    

    assert_file "app/models/#{Detail}.rb"
    assert_file "test/fixtures/#{Detail}s.yml"
    assert_file "test/unit/#{Detail}_test.rb"
    assert_migration "db/migrate/create_#{Detail}s.rb"

    
  end

  test "truth" do
    assert_kind_of Module, NestedScaffold::Generators::NestedScaffoldGenerator
  end

private
  def prepare_dummy_files
    FileUtils.cd(File.expand_path("../tmp", File.dirname(__FILE__))) do
      FileUtils.mkdir('config')    
      FileUtils.touch('config/routes.rb')
      
      FileUtils.mkdir("db")    
      FileUtils.mkdir("db/migrate")    
      FileUtils.touch("db/migrate/20120313224522_create_#{Master}.rb")
      
    end
  end  
  
  def ls(path)
    d = File.expand_path("../tmp/"+path, File.dirname(__FILE__))
    puts "\nOutput from ls (#{d.inspect}):"
    Dir.foreach(d) do |f|
      puts f.inspect
    end 
  end  
end
