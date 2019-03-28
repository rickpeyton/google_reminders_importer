require "spec_helper"

module GoogleRemindersImporter
  RSpec.describe Import, type: :model do
    subject { Import.new("") }

    it { should validate_presence_of(:reminders) }

    it { should allow_values(file_fixture("sample_export.html").read).for(:reminders) }
    it { should_not allow_values([], 1, {}).for(:reminders) }
  end
end
