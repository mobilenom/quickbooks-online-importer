require 'csv'

class ChargebeeExport
  attr_accessor :export_path

  attr_reader :data

  def initialize(export_path)
    @export_path = export_path
    @data = {}
  end

  def load!
    load_customers!
    load_invoices!
  end

  private

  def load_customers!
    path = File.join(@export_path, "Customers.csv")
    @data[:customers] = []

    CSV.foreach(path, headers: true) do |row|
      @data[:customers] << row.to_hash
    end
  end

  def load_invoices!
    path = File.join(@export_path, "Invoices.csv")
    @data[:invoices] = []

    CSV.foreach(path, headers: true) do |row|
      @data[:invoices] << row.to_hash
    end
  end
end
