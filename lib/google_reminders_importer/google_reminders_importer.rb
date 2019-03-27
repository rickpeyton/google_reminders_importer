module GoogleRemindersImporter
  class GoogleRemindersImporter
    include ActiveModel::Validations
    
    def initialize(reminders)
    end

    def process
      [GoogleReminder.new]
    end
  end
end