module GoogleRemindersImporter
  class GoogleReminder
    attr_accessor :title
    attr_accessor :created
    attr_accessor :state
    attr_accessor :due
    attr_accessor :recurrence
    attr_accessor :frequency
    attr_accessor :start
    attr_accessor :end
    attr_accessor :hour
    attr_accessor :day

    def initialize(attributes = {})
      @title = attributes[:title]
      @created = attributes[:created]
      @state = attributes[:state]
      @due = attributes[:due]
      @recurrence = attributes[:recurrence]
      @frequency = attributes[:frequency]
      @start = attributes[:recurrence_start]
      @end = attributes[:recurrence_end]
      @hour = attributes[:recurrence_hour]
      @day = attributes[:recurrence_day]
    end
  end
end
