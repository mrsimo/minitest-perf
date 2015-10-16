# MiniTest::Perf

[![Build Status](https://travis-ci.org/rom-rb/rom.png?branch=master)][travis]
[![Code Climate](https://codeclimate.com/github/mrsimo/minitest-perf.png)][codeclimate]

[travis]: https://travis-ci.org/mrsimo/minitest-perf
[codeclimate]: https://codeclimate.com/github/mrsimo/minitest-perf

`minitest-perf` stores information about your minitest runs so that you can later analyze and see where
the pain points are. It's in pretty early beta status, so I'm more than glad to receive bug reports and
feature suggestions.

The current version works with Minitest 5 thanks to @nateberkopec, for Minitest 4 use version 0.0.3.

## Installation

Add `gem 'minitest-perf'` to your Gemfile.

## How it works

Every test that is executed is stored in a sqlite database for later query. Just require `minitest/perf`
somewhere in your test_helper, and you're good to go. Internally, `minitest/perf` includes itself as
just another module and starts feeding the sqlite database.

The sqlite database is stored by default as `.minitest-perf.db`. It can be set using either the
environment variable `MINITEST_PERF_DATABASE_URL`, or the `DATABASE_URL`.

Or setting it directly via ruby with:

```ruby
Minitest::Perf.database_url = 'sqlite3://localhost/some_other_file.db'
```

So far only local `sqlite3` databases allowed, but I'm using the database url strategy to allow for
flexibility in the future.

An executable is provided that prints a very basic analysis of the information it already has, but
the sqlite database is perfectly normal, so you can do your own queries.

This is an example:

```
$ minitest-perf
Slowest individual tests

      190.98ms | JobsCategoriesControllerLoggedOutTest#test_show_action_should_render_show_page_without_contact_distance_call_for_logged_out_users
      161.12ms | APostingFrozenNotificationActiveRecordTestCasTest#test_should_log_the_exception_and_any_additional_data_when_a_PerlBackend::Error_is_thrown
      147.39ms | VersionsTest#test_rubygems_version
      132.52ms | JobsCategoriesControllerLoggedInTest#test_show_action_should_show__all__postings_of_a_category_for_logged_in_users
      124.21ms | JobsCategoriesControllerLoggedInTest#test_should_show_all_postings_of_selected_subcategories
      122.99ms | OrderReachedAboutToRunOutOfPostingsBeforeLast24HoursTest#test_should_return_false_if_at_amount_left_is_15_percent_of_amount,_and_last_posting_created_within_24_hours
      121.98ms | JobsCategoriesControllerLoggedOutTest#test_show_action_should_show_all_public_postings_for_logged_out_users
      116.97ms | JobsCategoriesControllerUserDependantLanguageTest#test_should_show_postings_in_categories_user's_browser_language_and_default_language_en_logged-out
      110.12ms | JobsCategoriesControllerUserDependantLanguageTest#test_caching_of_cities_is_dependant_on_the_user's_language_logged-in
      109.20ms | PostingsControllerNewActionTest#test_should_take_the_posters_business_country_as_default_country_for_new_postings_on_GET


Slowest test suites

      116.07ms |    3 | JobsCategoriesControllerLoggedOutTest
      113.54ms |    2 | JobsCategoriesControllerUserDependantLanguageTest
       98.19ms |    1 | PublishToCompanyPostingControllerTest
       97.81ms |    1 | ShowActionPagingForPostingSearchTest
       79.66ms |    1 | PostingMostViewedNamedScopeTest
       78.92ms |    3 | OrderReachedAboutToRunOutOfPostingsBeforeLast24HoursTest
       68.92ms |    1 | Jobs::ProductAvailabilityTimePeriodOverlapTest
       68.53ms |    1 | TheMotherOfAllBillingCycleTests
       66.77ms |    4 | CategoriesTest
       62.60ms |    2 | RecommendationsActivityBoxFallbackTest
```

## TODO

These are nice to haves I'd like to implement in the future:

* Store also in mysql
* Web interface
