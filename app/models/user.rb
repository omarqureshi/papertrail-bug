class User < ActiveRecord::Base
  serialize :schedule, Bitstring::WeekScheduleSerializer.new
  has_paper_trail
end
