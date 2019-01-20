# frozen_string_literal: true

describe World do
  let(:world) { described_class.new }

  it { expect(world.cells).to eq [] }

  it 'add new cell' do
    world.add('some cell')

    expect(world.cells).to eq ['some cell']
  end

  describe 'cell searching' do
    let(:cell) { Cell.new(1, 1) }

    before { world.add(cell) }

    it { expect(world.cell_at(1, 1)).to eq cell }
    it { expect(world.cell_at(0, 0)).to be_nil }
  end
end
