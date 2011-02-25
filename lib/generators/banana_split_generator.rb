module BananaSplit
  module Generators
    class BananaSplitGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path("../templates", __FILE__)
      namespace "banana_split"

      def create_models
        copy_file "models/ab_test.rb", "app/models/ab_test.rb"
        copy_file "models/ab_test_variation.rb", "app/models/ab_test_variation.rb"
        copy_file "models/ab_test_run.rb", "app/models/ab_test_run.rb"
      end

      def create_migration
        migration_template "migrations/migration.rb", "db/migrate/create_banana_split_tables"
      end
      
      def self.next_migration_number(path)
        Time.now.utc.strftime("%Y%m%d%H%M%S")
      end
      
    end
  end
end
