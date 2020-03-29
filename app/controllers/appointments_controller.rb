class AppointmentsController < ApplicationController
  @appointments = Appointment.all

  def index
    appointments = Appointment.all
    render json: appointments.as_json(only: [:id, :title, :description, :start_time, :duration_in_minutes], include: {
      customer: {only: [:username, :id]},
      client: {only: [:username, :id]}
    })
  end

  def show
    appointment = Appointment.find params[:id]
    render json: appointment.as_json
  end

  def create
    new_appointment = Appointment.create do |a|
      a.id = params[:id]
      a.title = params[:title]
      a.description = params[:description]
      a.start_time = params[:start_time]
      a.duration_in_minutes = params[:duration_in_minutes]
      a.client_id = Client.find_or_create_by(username: params[:client])
      a.customer_id = Customer.find_or_create_by(username: params[:customer])
    end
    render json: new_appointment.as_json(only: [:id])
  end
end
