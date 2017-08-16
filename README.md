# nested_scaffold

A scaffold command that generates a set of perfectly working nested resource for Rails 4.2 and 5.

## Features

* Generates a nested child resource with a single command
* Generates a beautifully working bunch of code
* Automatically generates the appropriate model associations for ActiveRecord
* Haml ready

## Rails versions

4.2, 5.0, 5.1

## Install

Put this line in your Gemfile:

```ruby
gem 'nested_scaffold'
```

Then bundle.

## Usage

```
% rails generate nested_scaffold PARENT_NAME/NAME [field:type field:type] [options]
% rails destroy nested_scaffold
```

(Expects PARENT model to exist in advance)

## Example

While "Post" model exists,

```
% rails g nested_scaffold exercise/workout name:string content:text
```

This will create:

* workout {model, controller, helper, views, tests}
* nested resource route
* Exercise.has_many :workouts association
* And the rest of the following files:

```
Running via Spring preloader in process 13199
      invoke  active_record
      create    db/migrate/20170816173037_create_workouts.rb
      create    app/models/workout.rb
      invoke    test_unit
      create      test/models/workout_test.rb
      create      test/fixtures/workouts.yml
      insert    app/models/exercise.rb
      invoke  scaffold_controller
      create    app/controllers/workouts_controller.rb
      invoke    erb
      create      app/views/workouts
      create      app/views/workouts/index.html.erb
      create      app/views/workouts/edit.html.erb
      create      app/views/workouts/show.html.erb
      create      app/views/workouts/new.html.erb
      create      app/views/workouts/_form.html.erb
      invoke    test_unit
      create      test/controllers/workouts_controller_test.rb
      invoke    helper
      create      app/helpers/workouts_helper.rb
      invoke      test_unit
      invoke    jbuilder
      create      app/views/exercise/workouts
      create      app/views/exercise/workouts/index.json.jbuilder
      create      app/views/exercise/workouts/show.json.jbuilder
      create      app/views/exercise/workouts/_exercise_workout.json.jbuilder
      invoke  test_unit
      create    test/system/workouts_test.rb
      invoke  assets
      invoke    coffee
      create      app/assets/javascripts/workouts.coffee
      invoke    scss
      create      app/assets/stylesheets/workouts.scss
      invoke  scss
   identical    app/assets/stylesheets/scaffolds.scss
       route  resources :exercises do
    resources :workouts
  end
        gsub  config/routes.rb
```

## Options

Basically same as the original scaffold.

## TODO / known issues

* namespace (who needs?)
* third party orms
* fixture replacements

## Contributing to nested_scaffold

Pull requests are welcome on GitHub at https://github.com/amatsuda/nested_scaffold

## Copyright

Copyright (c) 2010 Akira Matsuda. The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
