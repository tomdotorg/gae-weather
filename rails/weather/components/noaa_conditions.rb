require 'logger'
require 'date'
require 'net/http'
require 'open-uri'
require 'rexml/document'
include REXML

# http://www.weather.gov/xml/current_obs/KBVY.xml

class NOAAConditionsWriter
  log = Logger.new(STDOUT)
  log.level = Logger::INFO

  LOCATION_FORECAST = "01915-forecast"
  HOST = 'www.weather.gov'
  PREFIX = "/xml/current_obs/"
  PORT = 80
  POSTFIX = ".xml"
#  STATION = ARGV[0] # Appconfig.noaa_location # "KBVY" #
  STATION = AppConfig.noaa_location
  URL = "http://" + HOST + PREFIX + STATION + POSTFIX
  f = open(URL) # open-uri - treat the URL as an input stream
  data = f.read
  log.debug(data)
  doc = Document.new(data)
  location = doc.elements[1].elements["station_id"].text
  as_of = Time.rfc822(doc.elements[1].elements["observation_time_rfc822"].text).utc
  record = NoaaConditions.find_by_as_of_and_location(as_of, location)
  log.debug(record)
  if (record.nil?)
    conditions = NoaaConditions.new
    conditions.conditions_xml = data
    conditions.location = location
    conditions.as_of = as_of
    conditions.conditions = doc.elements[1].elements["weather"].text
    conditions.visibility = doc.elements[1].elements["visibility_mi"].text.to_i
    conditions.save!
    log.debug(conditions)
  end
end