require "test_helper"
require "generators/tails/database/database_generator"

class Tails::DatabaseGeneratorTest < Rails::Generators::TestCase
  tests Tails::DatabaseGenerator
  destination Rails.root.join("tmp/generators")
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
