class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
    @status = Student.find(params[:id]).active
  end

  def activate
    @student = Student.find(params[:id])
    current_status = @student.active
    @student.update(active: !current_status)

    @student.save
    #@student.active == true ? @student.active = false : @student = true
    # if @student.active == true
    #   @student.active = false
    # else
    #   @student.active = true
    # end

    puts "===================== Setting #{@student.to_s} 'active' status from: #{current_status} to: #{@student.active}"
    redirect_to student_path(@student)
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end