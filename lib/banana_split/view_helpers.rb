module BananaSplit
  module ViewHelpers

    def ab_test(test_name, variations)
      test = AbTest.find_or_create_by_name(:name => test_name.to_s)

      test_run = AbTestRun.find_by_session_id_and_ab_test_id(session_id, test.id)

      variation = if test_run
        test_run.ab_test_variation
      else
        variation_name = variations.keys.sample
        AbTestVariation.find_or_create_by_ab_test_id_and_name(:ab_test_id => test.id, :name => variation_name)
      end

      variation_render_options = variations[variation.name.to_sym]

      test.runs.create({
        :ab_test_variation_id => variation.id,
        :session_id => session_id
      }) unless test_run

      variation_render_options ? render(variation_render_options) : nil
    end
  end
end
