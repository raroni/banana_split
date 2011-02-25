module BananaSplit
  module ViewHelpers

    def ab_test(test_name, designs)
      test = AbTest.find_or_create_by_name(:name => test_name.to_s)

      test_run = AbTestRun.find_by_session_id_and_ab_test_id(session_id, test.id)

      design = if test_run
        test_run.ab_test_design
      else
        design_name = designs.keys.sample
        AbTestDesign.find_or_create_by_ab_test_id_and_name(:ab_test_id => test.id, :name => design_name)
      end

      design_render_options = designs[design.name.to_sym]

      test.runs.create({
        :ab_test_design_id => design.id,
        :session_id => session_id
      }) unless test_run

      design_render_options ? render(design_render_options) : nil
    end
  end
end
