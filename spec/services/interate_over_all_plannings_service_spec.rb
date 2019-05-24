require 'rails_helper'

describe InterateOverAllPlanningsService, '#call', type: %i[services] do
  context 'When plannings file exists', :run_sidekiq_job do
    it 'Should raise a error' do
      expect { described_class.new.call(true) }.to raise_error
    end
  
    it 'Should change the queue size' do
      expect {
        HardWorker.perform_async()
      }.to change(HardWorker.jobs, :size).by(1)
    end
  end
end