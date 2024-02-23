class AddDebutDeReservationToAppointment < ActiveRecord::Migration[7.1]
  def change
    add_column :appointments, :debut_de_reservation, :datetime
  end
end
