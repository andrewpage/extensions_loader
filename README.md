# ExtensionsLoader

[![Gem Version](https://badge.fury.io/rb/extensions_loader.svg)](https://badge.fury.io/rb/extensions_loader)
[![Build Status](https://travis-ci.org/andrewpage/extensions_loader.svg?branch=master)](https://travis-ci.org/andrewpage/extensions_loader)

ExtensionsLoader is a lightweight gem that simplifies the extension of Ruby classes and modules. Rather than monkeypatching or managing your extension modules yourself, you can use ExtensionsLoader to easily include extension modules into pre-defined Ruby modules and classes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'extensions_loader'
```

And then execute:

```sh
$ bundle install
```

Or install it yourself with:

```bash
$ gem install extensions_loader
```

## Usage

First, you need to load the ExtensionsLoader gem in your code.

```ruby
require 'extensions_loader'
```

Then, you can define base classes and their extensions with the following mapping syntax:

```ruby
ExtensionsLoader.load!(
  ActiveRecord::Base => Extensions::Database::MyQueryCounter,
  String => [
    Extensions::MyColoredStrings,
    Extensions::MyURLGenerator
  ]
)
```

The key of the mapping hash is the **target**, and the value is the **extension(s)**. You can pass in a single extension as the value, or an Array of extensions. Both are valid.

This will include `Extensions::Database::MyQueryCounter` into `ActiveRecord::Base`, and `Extensions::MyColoredStrings` and `Extensions::MyURLGenerator` into `String`.

Using ExtensionsLoader to manage your Ruby extensions is much easier than the alternative, monkeypatching these classes individually.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/andrewpage/extensions_loader.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
