class AppointmentsController < ApplicationController
  @appointments = Appointment.all

  def show
    puts @appointments
    render json: @appointments.as_json(only: [:id], include: {
      customer: {only: [:username, :id]},
      client: {only: [:username, :id]},
      only: [:title, :description, :start_time, :duration_in_minutes]
    })
  end
end
