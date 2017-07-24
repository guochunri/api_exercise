class AddTrainLogoToTrains < ActiveRecord::Migration[5.0]
  def change
    add_column :trains, :trains_log, :string
  end
end
