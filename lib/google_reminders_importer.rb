require "active_model"
require "nokogiri"

require "google_reminders_importer/google_reminder"
require "google_reminders_importer/import"
require "google_reminders_importer/google_reminders_importer_error"
require "google_reminders_importer/version"

begin
  require "pry"
rescue LoadError # rubocop:disable Lint/HandleExceptions:
end

module GoogleRemindersImporter
  def self.import(reminders)
    import = Import.new(reminders)

    raise InvalidFormatError, import.errors.full_messages.join(".") unless import.valid?

    import.process
  end
end
