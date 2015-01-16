# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'minitest/perf/version'

Gem::Specification.new do |spec|
  spec.name          = "minitest-perf"
  spec.version       = Minitest::Perf::VERSION
  spec.authors       = ["Albert Llop"]
  spec.email         = ["mrsimo@gmail.com"]
  spec.description   = %q{Save test run data to find slow tests and other interesting information}
  spec.summary       = <<-SUMMARY
    Require minitest/perf when running your tests, and a handful of data will be recorded
    for later query and study. Find particularly slow tests, and understand your tests
    even more.
  SUMMARY
  spec.homepage      = "https://github.com/mrsimo/minitest-perf"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "mocha", "~> 1.1"
  spec.add_dependency "minitest", "~> 5.0"
  spec.add_dependency "sqlite3"
end
