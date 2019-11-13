class UserKlassesController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_user, except: %i[create index]

  def create
    puts "Enroll in klass"
    @klass_to_enroll = Klass.find(params[:klass_id])
    @user_to_enroll = User.find(params[:user_id])
    if @klass_to_enroll
      puts "We found the class"
      puts @klass_to_enroll

      if @user_to_enroll.klasses.include?(@klass_to_enroll)
        render json: {msg: "User already enrolled"}, status: :bad_request
      else
        UserKlass.create(klass: @klass_to_enroll, user: @user_to_enroll)
        render json: {msg: "enrolled in class"}, status: :created
      end

    else
      puts "klass not found"
      render json: {msg: "klass not found"}, status: :not_found
    end
  end

  def destroy
    puts "Unenroll in klass"
    puts @user.email
    @klasss = Klass.find(params[:klass_id])
    if @klasss
      puts "We found the class"
      puts @klasss
      @klasss.users.delete(@user)
      render json: {msg: "unenrolled from class"}, status: :ok

    else
      puts "klass not found"
      render json: {msg: "klass not found"}, status: :not_found
    end
  end

  private
end
