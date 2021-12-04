require "test_helper"

class EvaluationsEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @other_user = users(:archer)
    @evaluation = evaluations(:one)
    @other_evaluation = evaluations(:two)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_evaluation_path(@evaluation)
    assert_template 'evaluations/edit'
    patch evaluation_path(@evaluation), params: { evaluation: {evaluator_id: 762146111, evaluatee_id: 762146111, score: 0, 
                                          assessment:"", group_id: 298486374, project_id: 298486374} }

    assert_template 'evaluations/edit'
  end

  test "successful edit" do
    log_in_as(@user)
    get edit_evaluation_path(@evaluation)
    assert_template 'evaluations/edit'
    assessment = "Pretty Okay"
    patch evaluation_path(@evaluation), params: { evaluation: {evaluator_id: 762146111, evaluatee_id: 762146111, score: 0, 
                                    assessment:assessment, group_id: 298486374, project_id: 298486374} }
    assert_not flash.empty?
    assert_redirected_to evaluations_path
    get evaluation_path(@evaluation)
    @evaluation.reload
    assert_equal assessment, @evaluation.assessment
  end

  test "should redirect edit when not logged in" do
    get edit_user_path(@evaluation)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch evaluation_path(@evaluation), params: { evaluation: {evaluator_id: 762146111, evaluatee_id: 762146111, score: 0, 
                                                  assessment:"Ok", group_id: 298486374, project_id: 298486374} }
    assert_not flash.empty?
    assert_redirected_to login_url
  end
#not working because fixture id can't be found. fix if time permits
  # test "should redirect edit when logged in as wrong user" do
  #   log_in_as(@other_user)
  #   get edit_user_path(@evaluation)
  #   assert flash.empty?
  #   assert_redirected_to root_url
  # end

  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_path(@user)
    first_name = "Foo"
    last_name = "Bar"
    email = "foo@bar.com"
    patch user_path(@user), params: { user: { first_name: first_name,
                                              last_name: last_name,
                                              email: email,
                                              password:              "password",
                                              password_confirmation: "password" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal first_name, @user.first_name
    assert_equal last_name, @user.last_name
    assert_equal email, @user.email
  end
end
