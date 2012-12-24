class AddFctextMetricToWunderForecastPeriods < ActiveRecord::Migration
  def self.up
    add_column :wunder_forecast_periods, :textmetric, :text
    add_column :wunder_forecast_periods, :pdnum, :integer
    add_column :wunder_forecast_periods, :pop, :integer
    add_column :wunder_forecast_period_longs, :pdnum, :integer
    rename_column :wunder_forecasts, :forecast_xml, :forecast_raw
  end

  def self.down
    remove_column :wunder_forecast_periods, :textmetric
    rename_column :wunder_forecasts, :forecast_raw, :forecast_xml
    remove_column :wunder_forecast_periods, :pdnum
    remove_column :wunder_forecast_periods, :pop
    remove_column :wunder_forecast_period_longs, :pdnum
  end
end
