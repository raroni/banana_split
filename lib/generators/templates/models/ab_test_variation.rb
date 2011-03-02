class AbTestVariation < ActiveRecord::Base
  belongs_to :ab_test
  has_many :ab_test_runs
end
