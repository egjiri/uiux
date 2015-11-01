require 'uiux/version'
require 'rainbow/ext/string'

# Renamed UIUX module to just UI for simplicity of calling it
module UI
  def self.start(message, &block)
    start_heading message
    yield block
    finished
  rescue Exception => error
    puts "\nFailed  #{'↓' * 61} #{time}".color(:red)
    raise error
  end

  def self.heading(message)
    puts "\n#{message}".color(:green)
  end

  def self.message(message)
    puts "#{message}".color(:white)
  end

  def self.error(message) # Rename to fail one in the gem
    fail "ERROR: #{message}".color(:red)
  end

  def self.execute(command)
    puts '==> '.color(:blue) + command.color('#7F461D') # Brown
    puts result = `#{command}`
    result
  end

  def self.time
    "🕑  #{Time.now.utc} 🕑 ".color(:white)
  end

  private

  def self.start_heading(message)
    fail if message.length > 70
    puts '='.color(:cyan) * 100
    print message.color(:cyan)
    puts ' ' * (70 - message.length) + time
  end

  def self.finished
    puts "\nFinished#{' ' * 61} #{time}".color(:magenta)
    puts '='.color(:magenta) * 100
  end
end
