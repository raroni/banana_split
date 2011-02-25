class AbTestRun < ActiveRecord::Base
  belongs_to :ab_test
  belongs_to :ab_test_design
end
