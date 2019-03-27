require "active_model"

require "google_reminders_importer/google_reminder"
require "google_reminders_importer/google_reminders_importer"
require "google_reminders_importer/version"

begin
  require "pry"
rescue LoadError
end

module GoogleRemindersImporter
  def self.import(reminders)
    reminders_file = GoogleRemindersImporter.new(reminders)
    if reminders_file.valid?
      reminders_file.process
    else
      raise InvalidRemindersFormat, import.errors.messages
    end
  end
end
