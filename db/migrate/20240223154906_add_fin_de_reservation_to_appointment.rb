class AddFinDeReservationToAppointment < ActiveRecord::Migration[7.1]
  def change
    add_column :appointments, :fin_de_reservation, :datetime
  end
end
