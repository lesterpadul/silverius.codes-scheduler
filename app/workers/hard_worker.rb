class HardWorker
  include Sidekiq::Worker
  
  def perform(*args)
    logger.info "Things are happening."
    logger.debug { "debugging arguments => #{args.inspect}" }
  end
end
