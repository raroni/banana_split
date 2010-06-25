module BananaSplit
  module ViewHelpers
    
    def ab_test(test_name, designs)
      test = AbTest.find_or_create_by_name(:name => test_name.to_s)
      
      design_name = designs.keys.sample
      design_render_options = designs[design_name]
      design = AbTestDesign.find_or_create_by_ab_test_id_and_name :ab_test_id => test.id, :name => design_name.to_s
      
      test_run = test.runs.create({
        :ab_test_design_id => design.id, 
        :user_id => current_user_id
      })
      
      design_render_options ? render(design_render_options) : nil
    end
    
  end
end
