module GoogleRemindersImporter
  class Import
    include ActiveModel::Validations

    def initialize(reminders)
    end

    def process
      [GoogleReminder.new]
    end
  end
end