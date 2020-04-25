require 'csv'

class SaasAntImport
  attr_accessor :template_directory

  attr_reader :chargebee_data

  def initialize(chargebee_data, template_directory = default_template_directory)
    @template_path = template_path
    @chargebee_data = chargebee_data
  end

  def default_template_directory
    Pathname.new(File.join(__FILE__, "../../files/saas_ant_import/")).cleanpath
  end

  def write_sales_receipts!
    template_path = File.join(template_directory, "Sales Receipts.csv")
    output_path = Pathname.new(File.join(__FILE__, "../../output/")).cleanpath
    name = "sales_receipts_#{Time.now.to_s}.csv"

    template_csv = CSV.read(template_path, headers: true)

    CSV.open('wb') do |csv|
  end

  private

end
