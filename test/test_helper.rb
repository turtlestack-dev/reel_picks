require "simplecov"
require "simplecov-tailwindcss"

SimpleCov.start "rails" do
  formatter SimpleCov::Formatter::TailwindFormatter
  coverage_dir "tmp/coverage"

  add_group "Services", "app/services"
end

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end
