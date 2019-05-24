class HardWorker
  include Sidekiq::Worker

  def perform
    result = []

    File.open("#{Rails.root}/data/plannings.txt") do |line|
      result << line
    end
  end
end