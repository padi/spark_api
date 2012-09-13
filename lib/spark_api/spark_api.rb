module SparkApi
  extend Configuration
  extend MultiClient

  #:nocov:
  def self.logger
    if @logger.nil?
      @logger = Logger.new(STDOUT)
      @logger.level = Logger::INFO
    end
    @logger
  end
  #:nocov:

  def self.client(opts={})
    Thread.current[:spark_api_client] ||= SparkApi::Client.new(opts)
  end

  def self.method_missing(method, *args, &block)
    return super unless (client.respond_to?(method))
    client.send(method, *args, &block)
  end

  def self.reset
    reset_configuration
    Thread.current[:spark_api_client] = nil
  end
end
