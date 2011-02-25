class AbTest < ActiveRecord::Base
	has_many :variations, :class_name => 'AbTestVariation', :dependent => :destroy
	has_many :runs, :class_name => 'AbTestRun', :dependent => :destroy
end
