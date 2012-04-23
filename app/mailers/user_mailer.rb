class UserMailer < ActionMailer::Base
  default from: "noreply@projectbox.com"

  def   password_reset(user)
  	@user = user
  	mail :to => user.email, :subject => "ProjectBox Password Reset Request"
  end

  def invitation(email, project, user)
	  @project = project
    @user = user
  	mail :to => email, :subject => "Request to contribute the project"
  end

end
