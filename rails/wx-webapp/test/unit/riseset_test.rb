require 'test_helper'

# FIXME - make some tests
class RisesetTest < ActiveSupport::TestCase
  fixtures :risesets

# id	location	month	day	rise	      set
# 733	  01915	    1	   1	12:14:00	21:22:00
  def test_dark?
    d = Time.local(2012, 12, 25, 17, 00)
    # 17:00 EST is 22:00 UTC, right?
    assert_false(Riseset.dark?("01915", d))
    d += 1.hour
    assert(Riseset.dark?("01915", d))

    d = Time.local(2011, 1, 3, 5, 00)

    assert(Riseset.dark?("01915", d))
    assert(Riseset.dark?("01915", d.utc))
  end

  def test hours_of_daylight
    daylight = Riseset.riseset("01915",Time.local(2012, 12, 25))
    assert_equal(rs[:daylight].hour, 9)
    assert_equal(rs[:daylight].min, 5)
  end
end
