require 'rails_helper'

describe InterateOverAllPlanningsService, '#call', type: %i[services] do
  before do
    described_class.new.call
  end

  it 'Should interate over all plannings' do
    expect { Sidekiq::Worker.drain_all }.to_not raise_error
  end

  it 'Should change the queue size' do
    expect {
      HardWorker.perform_async(1, 2)
    }.to change(HardWorker.jobs, :size).by(1)
  end
end