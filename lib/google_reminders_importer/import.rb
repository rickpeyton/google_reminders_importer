module GoogleRemindersImporter
  class Import
    include ActiveModel::Validations

    attr_accessor :reminders

    validates_presence_of :reminders
    validates_format_of :reminders,
                        with: %r{<li data-reminder-id=.*data-application-source-number.*\W.*\W.*<li><label>Title:</label>},
                        message: "'%{value}' does not match the expected HTML structure. See https://github.com/rickpeyton/google_reminders_importer/blob/master/spec/fixtures/files/sample_export.html"

    def initialize(reminders)
      @reminders = reminders
      @converted_reminders = []
    end

    def process
      converted_reminders = []
      document = Nokogiri::HTML(reminders)
      raw_reminders = document.css("li[data-reminder-id]")
      raw_reminders.each do |raw_reminder|
        title = raw_reminder.css("li").find { |li| li.text.include?("Title") }&.css("span")&.text
        created = raw_reminder.css("li").find { |li| li.text.include?("Created time") }&.css("span")&.text
        state = raw_reminder.css("li").find { |li| li.text.include?("State") }&.css("span")&.text
        due = raw_reminder.css("li").find { |li| li.text.include?("Due date") }&.css("span")&.text
        recurrence = raw_reminder.css("li").find { |li| li.text.include?("Recurrence info") }
        if recurrence
          recurrence_frequency = recurrence.css("li").find { |li| li.text.include?("Frequency") }&.css("span")&.text
          recurrence_start = recurrence.css("li").find { |li| li.text.include?("Start") }&.css("span")&.text
          recurrence_end = recurrence.css("li").find { |li| li.text.include?("End") }&.css("span")&.text
          recurrence_hour = recurrence.css("li").find { |li| li.text.include?("Hour of day to fire") }&.css("span")&.text
          recurrence_day = recurrence.css("li").find { |li| li.text.include?("Day of week") }&.css("span")&.text
        end
        converted_reminders << GoogleReminder.new(
          title: title,
          created: created,
          state: state,
          due: due,
          recurrence: recurrence.present?,
          frequency: recurrence_frequency,
          start: recurrence_start,
          end: recurrence_end,
          hour: recurrence_hour,
          day: recurrence_day
        )
      end
      converted_reminders
    end
  end
end
