require 'test_helper'

class EvaluationIndexTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "index as logged in user contains evaluation linked to user" do
    log_in_as(@user)
    get evaluations_path
    assert response.body.include? "michael example"
  end

end
