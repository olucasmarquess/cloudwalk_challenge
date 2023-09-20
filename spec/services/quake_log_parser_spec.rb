# spec/services/quake_log_parser_spec.rb

require 'rails_helper'

RSpec.describe QuakeLogParser, type: :service do
  let(:log_path) { 'path/to/your/log/file.log' }
  let(:parser) { QuakeLogParser.new(log_path) }

  it 'should parse total kills correctly' do
    expect(parser.parse).to eq(expected_total_kills)
  end

end
