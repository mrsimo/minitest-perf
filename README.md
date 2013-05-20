# MiniTest::Perf

`minitest-perf` stores information about your minitest runs so that you can later analyze and see where
the pain points are.

## How it works

Every test that is executed is stored in a sqlite database for later query. Just require `minitet/perf` 
somewhere in your test_helper, and you're good to go. Internally, `minitest/pref` sets itself up as a 
minitest plugin and starts feeding the sqlite database.

An executable is provided that does prints a very basic analyzis of the information it already has.
This is an example:

```
$ be minitest-perf
Slowest individual tests

 25920001.38ms | test_should_NOT_create_posting_if_order_is_NOT_active
      180.88ms | test_should_return_empty_string_for_an_empty_xml_document
      163.11ms | test_show_action_should_render_show_page_without_contact_distance_call_for_logged_out_users
      161.93ms | test_should_log_the_exception_and_any_additional_data_when_a_PerlBackend::Error_is_thrown
      156.67ms | test_rubygems_version
      122.39ms | test_should_return_false_if_at_amount_left_is_15_percent_of_amount,_and_last_posting_created_within_24_hours
      117.41ms | test_should_take_the_posters_business_country_as_default_country_for_new_postings_on_GET
      117.34ms | test_show_action_should_show_all_public_postings_for_logged_out_users
      114.60ms | test_should_show_postings_in_categories_user's_browser_language_and_default_language_en_logged-out
      112.33ms | test_should_show_all_postings_of_selected_subcategories


Slowest test suites

  4320004.32ms |    6 | PostingOrderContingentTest
      112.14ms |    2 | JobsCategoriesControllerUserDependantLanguageTest
      106.51ms |    1 | ShowActionPagingForPostingSearchTest
      100.88ms |    3 | JobsCategoriesControllerLoggedOutTest
       95.36ms |    1 | PublishToCompanyPostingControllerTest
       82.91ms |    1 | PostingMostViewedNamedScopeTest
       81.53ms |    3 | OrderReachedAboutToRunOutOfPostingsBeforeLast24HoursTest
       72.41ms |    1 | TheMotherOfAllBillingCycleTests
       68.09ms |    2 | RecommendationsActivityBoxFallbackTest
       65.93ms |    3 | OrderReachedAboutToRunOutOfPostingsInLast24HoursTest
```

## Caveats

If you use mocha and you stub `Time.now` some time, it might interfere with the times `minitest-perf` will calculate.
To avoid this, `mocha` (or `mocha/setup`) must be required *before* `minitest-perf`.

This is accomplished by setting `require: false` in the gemfile (at least for `minitest-perf`), and making sure 
you require `mocha` before it.

## TODO

These are nice to haves I'd like to implement in the future:

* Customizable db file
* Store also in mysql
* Web interface 
