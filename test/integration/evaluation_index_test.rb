require 'test_helper'

class EvaluationIndexTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "index as logged in user contains evaluation linked to user" do
    log_in_as(@user)
    get evaluations_path
    byebug
    assert response.body.include? "Michael Example"
end

end