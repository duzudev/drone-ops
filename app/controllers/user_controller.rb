# app/controllers/example_controller.rb

class UserController < ApplicationController
  def send_test_email
    UserMailer.test_email.deliver_now
    redirect_to root_path, notice: 'Test email sent!'
  end
end
