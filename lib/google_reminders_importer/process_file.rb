module GoogleRemindersImporter
  module ProcessFile
    def self.call(reminders)
      [GoogleReminder.new]
    end
  end
end