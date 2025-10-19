# Mathn

[![Build Status](https://travis-ci.org/ruby/mathn.svg?branch=master)](https://travis-ci.org/ruby/mathn)

mathn serves to make mathematical operations more precise in Ruby and to integrate other mathematical standard libraries.

Without mathn:

```ruby
3 / 2 => 1 # Integer
```

With mathn:

```ruby
require "mathn"
using Math::N
3 / 2 => 3/2 # Rational
```

mathn keeps value in exact terms.

Without mathn:

```ruby
20 / 9 * 3 * 14 / 7 * 3 / 2 # => 18
```

With mathn:

```ruby
require "mathn"
using Math::N
20 / 9 * 3 * 14 / 7 * 3 / 2 # => 20
```

## Global Behavioral changes

While older version of 'mathn', just by required, caused changes to
the behavior (and even the types) of operations on classes like
Integer, newer `mathn` introduces the refinements `Math::N`, and you
have to enable it.

Before ruby 2.5, `mathn` was part of the ruby standard library. It was
[deprecated in ruby 2.2.0](https://github.com/ruby/ruby/blob/v2_2_0/NEWS#stdlib-compatibility-issues-excluding-feature-bug-fixes),
and [removed from ruby 2.5.0](https://github.com/ruby/ruby/blob/ruby_2_5/NEWS#stdlib-compatibility-issues-excluding-feature-bug-fixes).
In order to use the library with a current version of ruby,
you must install it as a gem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mathn'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mathn

## Usage

```ruby
require 'mathn'
using Math::N
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ruby/mathn.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
