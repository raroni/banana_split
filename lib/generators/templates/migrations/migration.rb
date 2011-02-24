class CreateBananaSplitTables < ActiveRecord::Migration
  def self.up
    create_table(:ab_tests) do |t|
      t.string :name
    end
    
    create_table(:ab_test_designs) do |t|
      t.references :ab_test
      t.string :name
    end
    
    create_table(:ab_test_runs) do |t|
      t.string :session_id
      t.references :ab_test
      t.references :ab_test_design
      t.integer :value, :null => false, :default => 0
    end
  end

  def self.down
    drop_table :ab_tests
    drop_table :ab_test_designs
    drop_table :ab_test_runs
  end
end
