# frozen_string_literal: true

describe Cell do
  let(:world)       { World.new }
  let(:coordinates) { [1, 1] }
  let(:cell)        { described_class.new(*coordinates) }

  it { expect(cell.x).to eq 1 }
  it { expect(cell.y).to eq 1 }
  it { expect(cell.live).to eq false }

  context 'neighbours' do
    let(:neighbour)     { described_class.new(1, 0) }
    let(:not_neighbour) { described_class.new(100, 100) }

    it 'world is empty' do
      expect(cell.neighbours(world)).to eq []
    end

    it 'have a neighbour' do
      world.add(neighbour)
      world.add(not_neighbour)

      expect(cell.neighbours(world)).to eq [neighbour]
    end
  end
end
