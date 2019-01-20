# frozen_string_literal: true

describe World do
  let(:world) { described_class.new }

  it { expect(world.cells).to eq [] }

  it 'add new cell' do
    world.add('some cell')

    expect(world.cells).to eq ['some cell']
  end
end
