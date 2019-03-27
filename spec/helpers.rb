module Helpers
  def file_fixture(file)
    File.open("spec/fixtures/files/#{file}")
  end
end