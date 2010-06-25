class AbTest < ActiveRecord::Base
	has_many :designs, :class_name => 'AbTestDesign', :dependent => :destroy
	has_many :runs, :class_name => 'AbTestRun', :dependent => :destroy
end
