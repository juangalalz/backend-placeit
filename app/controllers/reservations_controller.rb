class ReservationsController < ApplicationController
  before_action :load_reservations, only: [:index]
  before_action :load_reservation, only: [:show]

  def index
    render json: ListResponse.new(data: @reservations,
                                  message: "")
  end

  def show
    unless @reservation
      render json: SingleResponse.new(message: 'La reserva no existe'), status: :not_found
      return
    end
    render json: @reservation, serializer: ReservationSerializer, status: :ok
  end

  def create
    reservation = Reservation.new(reservation_params)
    unless reservation.valid?
      render json: reservation.errors, status: :unprocessable_entity
      return
    end

    unless reservation.valid?
      render json: reservation.errors, status: :unprocessable_entity
      return
    end

    unless reservation.chairs_available?
      render json: {
        email: ['No hay sillas disponibles']
      }, status: :forbidden
      return
    end

    reservation.save!

    render json: reservation, serializer: ReservationSerializer, status: :created
  end

  private

  def reservation_id
    params[:id]
  end

  def load_reservations
    params = query_params
    @reservations = Reservation
    @reservations = @reservations.where(movie_id: params[:movie_id]) if params[:movie_id]
    @reservations = @reservations.order(created_at: :asc)
  end

  def load_reservation
    @reservation = Reservation.where(id: reservation_id).first
  end

  def query_params
    params.permit(:movie_id)
  end

  def reservation_params
    params.require(:reservation).permit(:movie_id,
                                       :identification_card,
                                       :full_name,
                                       :phone,
                                       :email)
  end

end
