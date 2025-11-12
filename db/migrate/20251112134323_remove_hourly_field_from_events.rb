class RemoveHourlyFieldFromEvents < ActiveRecord::Migration[8.0]
  def change
    remove_column :events, :hourly, :datetime
  end
end
