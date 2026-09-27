# Events

A basic Rails application for managing events.

## Prerequisites

- **Ruby** — install the version specified in `.ruby-version` (or `.tool-versions`)
  using your preferred version manager (e.g. rbenv, mise, asdf, rvm).
- **C compiler** — some gems include native extensions. On macOS, run
  `xcode-select --install` if you don't already have the command-line tools.

## Setup

```shell
bundle install
bundle exec rails db:setup
bundle exec rails s
# Visit http://localhost:3000/
```

## Running specs

```shell
bundle exec rspec
```

Specs use the `:test` Active Job adapter, so a running Redis is **not** required
for the test suite.

## Background jobs (Sidekiq)

The application is wired to use [Sidekiq](https://github.com/sidekiq/sidekiq) as
its Active Job backend. If you want to process jobs locally or inspect the
Sidekiq dashboard:

1. Start Redis (`redis-server` or `brew services start redis`).
2. Start Sidekiq: `bundle exec sidekiq`.
3. Visit `/sidekiq` in your browser for the web dashboard.

Background jobs are not required for the core events functionality — the app
boots and runs without Redis.

## Troubleshooting

### Native gem build failures

If `bundle install` fails building a gem with native extensions (e.g. `sassc`),
make sure you have the Xcode command-line tools installed:

```shell
xcode-select --install
```

### Bundler version warnings

If you see warnings about the bundler version not matching `BUNDLED WITH` in the
lockfile, you can install the expected version:

```shell
gem install bundler -v "$(grep -A 1 'BUNDLED WITH' Gemfile.lock | tail -1 | tr -d ' ')"
```

This is usually harmless — the app will still work with a different bundler version.
