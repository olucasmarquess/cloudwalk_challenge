require 'rails_helper'

RSpec.describe Match, type: :model do
  it 'should have a valid factory' do
    expect(FactoryBot.build(:match)).to be_valid
  end

  it 'should calculate total kills' do
    match = FactoryBot.create(:match, kills: {'Player1' => 5, 'Player2' => 3})
    expect(match.total_kills).to eq(8)
  end
end