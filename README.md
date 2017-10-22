# Mathn

[![Build Status](https://travis-ci.org/ruby/mathn.svg?branch=master)](https://travis-ci.org/ruby/mathn)

mathn serves to make mathematical operations more precise in Ruby and to integrate other mathematical standard libraries.

Without mathn:

```
3 / 2 => 1 # Integer
```

With mathn:

```
3 / 2 => 3/2 # Rational
```

mathn keeps value in exact terms.

Without mathn:

```
20 / 9 * 3 * 14 / 7 * 3 / 2 # => 18
```

With mathn:

```
20 / 9 * 3 * 14 / 7 * 3 / 2 # => 20
```

When you require 'mathn', the libraries for Prime, CMath, Matrix and Vector are also loaded.

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

```
require 'mathn'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hsbt/mathn.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
