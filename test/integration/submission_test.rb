require 'test_helper'

class SubmissionIntegrationTest < ActionDispatch::IntegrationTest
  test "submit for ongoing contest and see passed in sidebar" do
    user = sign_in

    within "#sidebar" do
      click_link tasks(:ongoing_hello_world).name
    end

    within "#content" do
      attach_file "submission_source", Rails.root + "test/data/submissions/hello_world.rb"
      click_button "Evaluate"
    end

    within "#sidebar" do
      assert_selector ".label-success", text: "Passed"
    end
  end

  test "submit for past contest and see no passed in sidebar" do
    user = sign_in

    within "#sidebar" do
      click_link tasks(:past_hello_world).name
    end

    within "#content" do
      attach_file "submission_source", Rails.root + "test/data/submissions/hello_world.rb"
      click_button "Evaluate"
    end

    within "#sidebar" do
      assert_no_selector ".label-success", text: "Passed"
    end
  end
end
