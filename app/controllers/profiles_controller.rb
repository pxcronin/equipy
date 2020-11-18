class ProfilesController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def show
    # Bookings the current user made
    @my_bookings = Booking.where(user: current_user)

    # Bookings people made on current user's equipment
    my_equipment = Equipment.where(user: current_user)
    @my_equipment_bookings = my_equipment.map do |equipment|
      Booking.where(equipment_id: equipment.id).where(accepted: "pending")
    end
    @my_equipment_bookings = @my_equipment_bookings[0]
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to profile_path
    else
      render :edit
    end
  end

  private

  def set_user
    @user = current_user
    authorize @user
  end

  def user_params
    params.require(:user).permit(:email, :profile_picture)
  end
end
