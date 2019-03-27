require "active_model"

require "google_reminders_importer/google_reminder"
require "google_reminders_importer/process_file"
require "google_reminders_importer/reminders_file"
require "google_reminders_importer/version"

begin
  require "pry"
rescue LoadError
end

module GoogleRemindersImporter
  def self.import(reminders)
    reminders_file = RemindersFile.new(reminders)
    if reminders_file.valid?
      ProcessFile.call(reminders_file)
    else
      raise InvalidRemindersFormat, import.errors.messages
    end
  end
end
