require 'uiux/version'
require 'rainbow/ext/string'
require 'awesome_print'

# Renamed UIUX module to just UI for simplicity of calling it
module UI
  def self.start(message, &block)
    start_heading message
    yield block
    finished
  rescue Exception => error
    puts heading_with_columns("\nFailed", '↓', time).color(:red)
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
    puts "#{'==>'.color(:blue)} #{command.bright}"
    puts result = `#{command}`
    result
  end

  def self.time
    "🕑  #{Time.now.utc} 🕑 ".color(:white)
  end

  private

  def self.start_heading(message)
    puts heading_with_columns(nil, '='.color(:cyan), nil)
    puts heading_with_columns(message.color(:cyan), ' ', time)
  end

  def self.finished
    puts heading_with_columns("\nFinished".color(:magenta), ' ', time)
    puts heading_with_columns(nil, '='.color(:magenta), nil)
  end

  def self.heading_with_columns(first_str, spacer_str, last_str, length = 100)
    first_str = first_str ? "#{first_str} " : ''
    last_str = last_str ? " #{last_str}" : ''
    min_length = str_length("#{first_str}#{last_str}")
    if min_length > length # Truncates long headings
      first_str = first_str[0..-(min_length - length + 8)] + '...'
      min_length = str_length("#{first_str}#{last_str}")
    end
    reps = (length - min_length) / str_length(spacer_str)
    "#{first_str}#{spacer_str * reps}#{last_str}"
  end

  def self.str_length(str)
    str = str.gsub(/\e\[\d+m/, '') # remove colors
    str.chars.each_with_object('') do |char, new_str|
      new_str << char unless char.ascii_only? && (char.ord < 32 || char.ord == 127)
    end.length
  end
end
