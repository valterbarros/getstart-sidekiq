class InterateOverAllPlanningsService
  def call
    HardWorker.perform_async()
  end
end