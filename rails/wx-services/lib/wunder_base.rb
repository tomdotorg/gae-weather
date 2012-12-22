require 'logger'
require 'wunderground'

class WunderBase
  def obtain_location
    @location = ARGV[0] ||= AppConfig.noaa_location
  end

  def obtain_key
    @key = AppConfig.wunderground_key
  end

  def init_api
    @w_api = Wunderground.new(@key)
  end

  def init
    obtain_key
    obtain_location
    init_api
  end

  def show_key
    puts "using key:" + @key
  end
end
