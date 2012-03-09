module BananaSplit
  module Controller
    extend ActiveSupport::Concern

    included do
      helper_method :session_id
    end

    def ab_goal(test_name, value = 1)
      test = AbTest.find_by_name(test_name)
      return if test.blank?
      test_run = AbTestRun.find_by_session_id_and_ab_test_id(session_id, test.id)
      if test_run && test_run.value == 0
        test_run.update_attribute(:value, value)
      end
    end

    def session_id
      banana_init_session if request.session_options[:id].blank?
      request.session_options[:id]
    end
  end

  def banana_init_session
    session['banana_session_init_hack'] = 'this is a bit of a hack to make sure the session is always initialized'
    session.delete('banana_session_init_hack')
  end
end
