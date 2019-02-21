# nested_scaffold

A scaffold command that generates a set of perfectly working nested resource for Rails 4.2 and 5.

## Features

* Generates a nested child resource with a single command
* Generates a beautifully working bunch of code
* Automatically generates the appropriate model associations for ActiveRecord
* Haml ready

## Rails versions

4.2, 5.0, 5.1, 5.2

## Install

Put this line in your Gemfile:

```ruby
gem 'nested_scaffold'
```

Then bundle.

## Usage

```
% rails generate nested_scaffold PARENT_NAME/NAME [field:type field:type] [options]
```

(Expects PARENT model to exist in advance)

## Example

While "Post" model exists,

```
% rails g nested_scaffold post/comment name:string content:text
```

This will create:

* comment {model, controller, helper, views, tests}
* nested resource route
* Post.has_many :comments association

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
