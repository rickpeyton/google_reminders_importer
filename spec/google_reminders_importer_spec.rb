require "spec_helper"

RSpec.describe GoogleRemindersImporter do
  it "has a version number" do
    expect(GoogleRemindersImporter::VERSION).not_to be nil
  end

  it "parses a Google Reminders export into an array of Google Reminders" do
    result = GoogleRemindersImporter.import(file_fixture("sample_export.html").read)

    expect(result.first).to be_a GoogleRemindersImporter::GoogleReminder
  end
  
  it "raises an exception when reminders is not a valid reminders file" do
    expect { GoogleRemindersImporter.import("invalid") }
      .to raise_error(
        GoogleRemindersImporter::InvalidFormatError,
        /does not match/
      )
  end
end
