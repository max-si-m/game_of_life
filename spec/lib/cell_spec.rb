# frozen_string_literal: true

describe Cell do
  let(:world)       { World.new }
  let(:coordinates) { [1, 1] }
  let(:cell)        { described_class.new(world, *coordinates) }

  it { expect(cell.x).to eq 1 }
  it { expect(cell.y).to eq 1 }
  it { expect(cell.live).to eq true }

  it 'kill the cell' do
    cell.kill!

    expect(cell.live).to eq false
  end

  context 'neighbours' do
    let(:neighbour)       { described_class.new(world, 1, 0) }
    let(:dead_neighbour)  { described_class.new(world, 1, 2, live: false) }
    let(:not_neighbour)   { described_class.new(world, 100, 100) }

    it 'world is empty' do
      expect(cell.neighbours).to eq []
    end

    it 'have a neighbour' do
      world.add(neighbour)
      world.add(not_neighbour)

      expect(cell.neighbours).to eq [neighbour]
    end

    it 'live neighbours' do
      world.add(neighbour)
      world.add(dead_neighbour)

      expect(cell.alive_neighbour_count).to eq 1
    end
  end

  describe 'toogle' do
    let(:neighbour)         { described_class.new(world, 1, 0) }
    let(:second_neighbour)  { described_class.new(world, 1, 0) }
    let(:next_neighbour)    { described_class.new(world, 1, 3) }
    let(:dead_neighbour)    { described_class.new(world, 1, 2, live: false) }

    context 'one alive neighbour' do
      before do
        world.add(cell)
        world.add(neighbour)
        cell.toggle
      end

      it { expect(cell.live).to be false }
    end

    context 'three alive neighbours' do
      before do
        world.add(cell)
        world.add(neighbour)
        world.add(second_neighbour)
        world.add(next_neighbour)
        cell.toggle
      end

      it { expect(cell.live).to be false }
    end
  end
end
