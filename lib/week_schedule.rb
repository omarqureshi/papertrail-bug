module Bitstring
  class WeekScheduleSerializer
    def dump(val)
      return if val.nil?
      WeekSchedule.new(val).to_bitstring
    end

    def load(val)
      return if val.nil?
      WeekSchedule.bitstring_to_week_schedule(val)
    end
  end

  class WeekSchedule
    attr_reader :schedule_hash

    def initialize(week_hash)
      raise(ArgumentError, "Must be a hash of size 7") unless week_hash.kind_of? Hash
      raise(ArgumentError, "Must be a hash of size 7") unless week_hash.size == 7
      week_hash.assert_valid_keys(*Date::ABBR_DAYNAMES.map(&:downcase))
      @schedule_hash = week_hash
    end

    def to_bitstring
      schedule_hash.values.map {|x| x ? "1" : "0" }.join("")
    end

    def run_on?(date=Date.today)
      (to_bitstring.to_i(2) & date.to_bitstring.to_i(2)) == date.to_bitstring.to_i(2)
    end

    def self.bitstring_to_week_schedule(val)
      Hash[Date::ABBR_DAYNAMES.map(&:downcase).zip(val.split(//).map {|x| x == "1" })]
    end
  end
end

class Date

  def to_bitstring
    (0..6).inject("") { |mem, day| mem += day == wday ? "1" : "0" }
  end

end
