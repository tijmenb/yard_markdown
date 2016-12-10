⚠️ This gem is experimental and unreleased ⚠️

---

[![Inline docs](http://inch-ci.org/github/tijmenb/yard_markdown.svg?branch=master)](http://inch-ci.org/github/tijmenb/yard_markdown)
[![CircleCI](https://circleci.com/gh/tijmenb/yard_markdown.svg?style=svg)](https://circleci.com/gh/tijmenb/yard_markdown)
[![Code Climate](https://codeclimate.com/github/tijmenb/yard_markdown/badges/gpa.svg)](https://codeclimate.com/github/tijmenb/yard_markdown)

# YARD Markown

Create gem docs that look nice on GitHub.

👉 [See the example for this gem](docs)

Project goals:

- The generated markdown should look good on GitHub
- The markdown should reusable
- As little configuration as possible

It should only document modern gems. The documentation should be focused on
the user, not a contributor. We only document public APIs.

Limitations:

- `@see` tags don't link internally. That may be hard to do in straight Markown.

Tags still to be implemented:

- `@deprecated` for classes
- `@raise`
- `@yield`, `@yieldparam`, `@yieldreturn`

No plans to implement:

- `@overload`, `@since`, `@todo` and `@version`
- all the `@!` directives

## Installation

Add this line to your application's Gemfile:

```ruby
# Gemfile
gem 'yard_markdown'
```

Add this to your `Rakefile`:

```ruby
# Rakefile
task :docs do
  require 'yard_markdown'
  YardMarkdown::Generator.generate(
    github_repo: "alphagov/gds-api-adapters",
  )
end
```

Now run:

```
bundle exec rake docs
```

You'll find your documentation in `docs/readme.md`.

You can also do:

```
bundle exec yard_markdown --github_repo=alphagov/gds-api-adapters
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tijmenb/yard_markdown.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
