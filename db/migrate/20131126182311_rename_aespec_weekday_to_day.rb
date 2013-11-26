class RenameAespecWeekdayToDay < ActiveRecord::Migration
  def change
    rename_column :ae_specs, :weekday, :day
  end
end
