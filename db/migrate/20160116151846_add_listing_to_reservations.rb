class AddListingToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :listing_id, :integer
    add_column :reservations, :user_id, :integer
  end
end
