require "google_reminders_importer/google_reminder"
require "google_reminders_importer/version"

begin
  require "pry"
rescue LoadError
end

module GoogleRemindersImporter
  def self.import(reminders)
    # Validate format of reminders file
    # Process the reminders file
    # Return a collection of GoogleReminder objects
    [GoogleReminder.new]
  end
end
