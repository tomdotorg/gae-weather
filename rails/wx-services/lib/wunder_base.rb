require 'logger'
require 'wunderground'

class WunderBase
  def initialize
    @location = ARGV[0] ||= AppConfig.noaa_location
    @key = AppConfig.wunderground_key
    @api = Wunderground.new(@key)
  end
end
