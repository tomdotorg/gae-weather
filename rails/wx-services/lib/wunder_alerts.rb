require 'logger'
require 'wunderground'
require 'json'

#TODO avoid dups (location + date + type?)
class WunderAlertManager < WunderBase
  def alerts
    a = @w_api.alerts_for(@location)
    num_alerts = a["response"]["features"]["alerts"]
    if num_alerts > 0
      a["alerts"].each do |alert|
        adate = Time.parse(alert["date"]).utc
        atype = alert["type"]
        a = Alert.find_or_create_by_location_and_date_and_atype(@location, adate, atype)
        a.phenomena = alert["phenomena"]
        a.significance = alert["significance"]
        a.description = alert["description"]
        a.date = Time.parse(alert["date"]).utc
        a.expires = Time.parse(alert["expires"]).utc
        a.message = alert["message"]
        a.wtype_meteoalarm = alert["wtype_meteoalarm"]
        a.wtype_meteoalarm_name = alert["wtype_meteoalarm_name"]
        a.level_meteoalarm = alert["level_meteoalarm"]
        a.level_meteoalarm_name = alert["level_meteoalarm_name"]
        a.level_meteoalarm_description = alert["level_meteoalarm_description"]
        a.attribution = alert["attribution"]
        a.save!
      end
    end
  end
end

w = WunderAlertManager.new
w.init
c = w.alerts()


#a["alerts"][0]["message"].gsub("\n", "")
  #weather station code uniqueness - they use the 'pws:' prefix for weather station codes. So does this wrapper.
  #w_api.conditions_for("pws:STATIONCODE")

  # to convert epoch to datetime: Time.at(1351429500)

#def conditions
#  open('http://api.wunderground.com/api/' + @key + '/geolookup/conditions/q/IA/Cedar_Rapids.json') do |f|
#    json_string = f.read
#    parsed_json = JSON.parse(json_string)
#    location = parsed_json['location']['city']
#    temp_f = parsed_json['current_observation']['temp_f']
#    print "Current temperature in #{location} is: #{temp_f}\n"
#  end
#end

#def current_conditions
#  return @w_api.conditions_for(@location)
#end

#def forecast
#  w_api.forecast_for(@location)
#end

