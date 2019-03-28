module GoogleRemindersImporter
  class Import
    include ActiveModel::Validations
    
    attr_accessor :reminders

    validates_presence_of :reminders
    validates_format_of :reminders, 
      with: /<li data-reminder-id=.*data-application-source-number.*\W.*\W.*<li><label>Title:<\/label>/,
      message: "'%{value}' does not match the expected HTML structure. See https://github.com/rickpeyton/google_reminders_importer/blob/master/spec/fixtures/files/sample_export.html"

    def initialize(reminders)
      @reminders = reminders
    end

    def process
      [GoogleReminder.new]
    end
  end
end