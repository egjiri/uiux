# UIUX

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/uiux`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'uiux'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install uiux

## Usage

* `UI.start` block provides start and finish headers with start and end times. This also provides better error display output which also includes the time
* `UI.heading` display a green heading with a line return before
* `UI.message` display a white message
* `UI.error` dispay a red error message
* `UI.execute` displays the command to execute, executes it and shows the output and also returns the result for potential further manipulations

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/uiux.
