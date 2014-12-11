require 'bunny'
require 'optparse'
require 'ostruct'
require 'pp'

class Options

  def parse(args)

    options = OpenStruct.new
    options.verbose = false

    options.q = "customer"
    options.f = ""
    options.n = "localhost"
    options.p = "4567"
    options.e = "api/1.0/event"

    opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: sim.rb [options]"

      # Boolean switch.
      opts.on("-v", "Run verbosely") do |v|
        options.verbose = v
      end

      opts.on("-n Host", "Host name") do |q|
        options.n = q
      end

      opts.on("-p Port", "Port number") do |q|
        options.p = q
      end

      opts.on("-e Endpoint", "Endpoint URL") do |q|
        options.e = q
      end

      # Rule Type

      opts.on("-q Queue", "Queue name") do |q|
        options.q = q
      end

      opts.on("-f File", "File name") do |f|
        options.f = f
      end

      # No argument, shows at tail.  This will print an options summary.
      # Try it and see!
      opts.on_tail("-h", "--help", "Show this message") do
        puts opts
        exit
      end
    end
    opt_parser.parse!(args)
    options
  end
end

class Publisher

    def buildURL(options)
      hostname = options.n
      port = options.p
      endpoint = options.e
      url = "http://" + hostname + ":" + port + "/" + endpoint
    end

    def get_file_as_string(filename)
      data = ''
      f = File.open(filename, "r")
      f.each_line do |line|
        data += line
      end
      return data
    end

    def run(options)

      myurl = buildURL(options)
      puts myurl
      
      myjson = ""
      filename = options.f

      if filename == ""
        puts "Please enter a filename"
        return
      end

      myjson = get_file_as_string(filename)
      puts myjson

    end
end


mypublisher = Publisher.new
myoptions = Options.new
options = myoptions.parse(ARGV)
if options.verbose == true
  puts options
end
mypublisher.run(options)
