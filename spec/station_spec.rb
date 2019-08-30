require 'station'

describe Station do
  subject {described_class.new("Old street", 1)}

  it "knows what station it is" do
    expect(subject.name).to eq("Old street")
  end
  it "knows what zone it is" do
    expect(subject.zone).to eq(1)
  end
end
