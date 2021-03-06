class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :layout_by_resource

  def after_sign_in_path_for(user)
    latest_student_question = ::LatestStudentQuestionFinder.new(user.student).find_or_create_latest_student_question
    "#!/student_questions/#{latest_student_question.try(:id)}"
  end

  protected

  def layout_by_resource
    if devise_controller?
      "login"
    else
      "application"
    end
  end
end
