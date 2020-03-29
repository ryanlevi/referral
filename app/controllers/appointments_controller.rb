class AppointmentsController < ApplicationController


  def index
    if params[:active] == '1'
      appointments = Appointment.where('start_time > ?', DateTime.now)
    else
      appointments = Appointment.all
    end
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
      a.client_id = Client.find_or_create_by(username: params[:client]).id
      a.customer_id = Customer.find_or_create_by(username: params[:customer]).id
    end
    render json: new_appointment.as_json(only: [:id])
  end

  def destroy
    appointment = Appointment.find params[:id]
    appointment_title = appointment.title
    appointment.destroy
    render json: "#{appointment_title} deleted."
  end

  def destroy_all
    appointments = Appointment.destroy_all
    render json: "Deleted all appointments."
  end
end
