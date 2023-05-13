class AttendancesController < ApplicationController
  before_action :authenticate_user!

  def create
    user = current_user
    @events = Event.all
    event = Event.find(params[:attended_event_id])
    attendance = event.attendances.new(user: user)
    if attendance.save
      redirect_to user_path(current_user.id), notice: 'You have successfully joined the event!'
    else
      flash.now[:errors] = attendance.errors.full_messages
      render 'events/index', status: :unprocessable_entity
    end
  end

  def destroy
    Attendance.find(params[:id]).destroy
    redirect_to events_path, notice: 'Sorry to see you go!'
  end
end
