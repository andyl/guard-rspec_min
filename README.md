# Guard::RspecMin

This is a minimal re-implementation of the `guard-rspec` plugin.  

This plugin has fewer configuration options that the original, but
has less code for simplicity and easier customization.

## Installation

Add this line to your application's Gemfile:

```ruby
group :development, :test do
  gem 'guard-rspec_min', require: false
end
```

And then execute:

    $ bundle

Add guard definition to your Guardfile:

    $ bundle exec guard init rspec_min

## Usage

Please read the guard usage doc.

## Options

### Specifying Options in Guardfile

```ruby
guard :rspec_min, {cmd: 'spring rspec -f doc'} do
  # ...
end
```

### Available Options

```ruby
cmd: 'spring rspec'       # Specify a custom command for rspec
tags: {a: true, b: false} # list of tags (empty is OK)
specs: ["asdf", "qwer"]   # list of regexes to match files
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/guard-rspec_min/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

