require_relative "../../lib/chargebee_export"

require "spec_helper"

RSpec.describe ChargebeeExport do
  let(:export_path) { 
    Pathname.new(File.join(__FILE__, "../../../files/chargebee_export_sample")).cleanpath
  }

  describe '#initialize' do
    subject { described_class.new(export_path) }

    it "sets the export_path" do
      expect(subject.export_path).to eq export_path
    end
  end

  describe "#load!" do
    let(:load!) { subject.load! }
    subject { described_class.new(export_path) }

    before do
      load!
    end

    it "loads customers" do
      expect(subject.data[:customers]).to_not be nil
      expect(subject.data[:customers][1]["Customer Id"]).to eq "1vlkHT0RiHDKOD32b"
      expect(subject.data[:customers][0]["Billing Address City"]).to eq "Pittsburgh"
    end

    it "loads invoices" do
      expect(subject.data[:invoices]).to_not be nil
      expect(subject.data[:invoices][0]["Customer Id"]).to eq "AzZcs7RnDDLJ31xrq"
      expect(subject.data[:invoices][1]["Invoice Number"]).to eq "138"
    end
  end
end
