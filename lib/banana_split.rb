module BananaSplit
  class << self
    
    def enable
      enable_view_helpers
      enable_controller
    end
    
    def enable_view_helpers
      require 'banana_split/view_helpers'
      ActionView::Base.send :include, ViewHelpers
    end
    
    def enable_controller
      require 'banana_split/controller'
      ActionController::Base.send :include, Controller
    end
    
  end
end

BananaSplit.enable
