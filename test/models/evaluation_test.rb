require "test_helper"

class EvaluationTest < ActiveSupport::TestCase
  def setup
    @evaluation = Evaluation.new(evaluator_id: User.first.id, evaluatee_id: User.first.id, score: 0, assessment:"Okay",
    group_id: Group.first.id, project_id: Project.first.id)
  end

  test "should be valid" do
    assert @evaluation.valid?
  end

  test "evaluator id should be present" do
    @evaluation.evaluator_id = nil
    assert_not @evaluation.valid?
  end

  test "evaluator id should be > 0" do
    @evaluation.evaluator_id = 0
    assert_not @evaluation.valid?
  end

  test "evaluatee id should be present" do
    @evaluation.evaluatee_id = nil
    assert_not @evaluation.valid?
  end

  test "evaluatee id should be > 0" do
    @evaluation.evaluatee_id = 0
    assert_not @evaluation.valid?
  end

  test "score should be present" do
    @evaluation.score = nil
    assert_not @evaluation.valid?
  end

  test "score should be > -1" do
    @evaluation.score = -1
    assert_not @evaluation.valid?
  end

  test "score should be < 101" do
    @evaluation.score = 101
    assert_not @evaluation.valid?
  end

  test "score should be >= 0" do
    @evaluation.score = 0
    assert @evaluation.valid?
  end

  test "score should be <= 100" do
    @evaluation.score = 100
    assert @evaluation.valid?
  end

  test "assessment should be present" do
    @evaluation.assessment = nil
    assert_not @evaluation.valid?
  end

  test "assessment should not be blank" do
    @evaluation.assessment = "    \t\n"
    assert_not @evaluation.valid?
  end

  test "group id should be present" do
    @evaluation.group_id = nil
    assert_not @evaluation.valid?
  end

  test "group id should be > 0" do
    @evaluation.group_id = 0
    assert_not @evaluation.valid?
  end

  test "project id should be present" do
    @evaluation.project_id = nil
    assert_not @evaluation.valid?
  end

  test "project id should be > 0" do
    @evaluation.project_id = 0
    assert_not @evaluation.valid?
  end
end
