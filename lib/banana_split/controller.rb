module BananaSplit
  module Controller
    def self.included(base)
      base.class_eval do
        helper_method :current_user_id
      end
    end
    
    def ab_goal(test_name, value = 1)
      test_run = AbTestRun.last :conditions => { :user_id => current_user_id }
      if test_run && test_run.value == 0
        test_run.update_attribute(:value, value)
      end
    end
    
    def current_user_id
      current_user.id
    end
    
  end
end
