require "active_model"

require "google_reminders_importer/google_reminder"
require "google_reminders_importer/import"
require "google_reminders_importer/version"

begin
  require "pry"
rescue LoadError
end

module GoogleRemindersImporter
  def self.import(reminders)
    import = Import.new(reminders)
    if import.valid?
      import.process
    else
      raise InvalidRemindersFormat, import.errors.messages
    end
  end
end
