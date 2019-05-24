class HardWorker
  include Sidekiq::Worker

  def perform
    puts 'start running sidekiq job'

    result = []
    
    File.open("#{Rails.root}/data/plannings.txt") do |line|
      result << line
    end
  end
end