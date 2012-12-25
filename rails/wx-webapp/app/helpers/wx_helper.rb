module WxHelper
  def highlight_alerts(alerts) # this does not work but demonstrates the purpose of the helper called from the view
    s = "<blink>"
    alerts.each do |a|
      # do something with the alerts in a and highlighting based on level (info, warning, etc)
      s << a << "&nbsp"
    end
    # should return s here once s has meaning
    return s << "</blink>"
  end
end

