require "google_reminders_importer/google_reminder"
require "google_reminders_importer/version"

begin
  require "pry"
rescue LoadError
end

module GoogleRemindersImporter
  def self.import(reminders)
    [GoogleReminder.new]
  end
end
