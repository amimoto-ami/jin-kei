namespace :ami do
  require 'amino'
  require 'erb'

  desc "Create ami mapping by query, $ rake ami:map['*Woo*MOD*','woo_mod']"
  task :map, ['query','output']
  task :map do |t, args|
    amis = {}
    template = File.read('./tasks/ami_template.erb')

    list_regions.map do |region|
      amis[region] = retrieve_id_by_amino(region, args['query'])
    end
    puts ERB.new(template, nil, '-').result(binding)
    if args['output'] then
      file_w = open( "./include/mapping/ami_" + args['output'] + ".rb", "w" )
      file_w.puts( ERB.new(template, nil, '-').result(binding) )
      file_w.close
    else
		puts 'no file outputs'
    end
  end

  desc "show list of AZs"
  task :az do

    client = ::Aws::EC2::Client.new(region: "us-east-1")
    list_regions.map do |region|
      print region + ": "
      puts client.describe_availability_zones.availability_zones.map {|az|
        az.zone_name
      }.to_s
    end
  end

  def list_regions
     regions = ::Aws::EC2::Client.new(region: "us-east-1").describe_regions.regions
     regions.map {|region| region.region_name}
  end

  def retrieve_id_by_amino(region, query)
    ami = Amino({'name' => query, 'product-code.type' => "marketplace"}, {region: region}).last
    return nil unless ami
    $stderr.puts [region, ami.name, ami.creation_date].join(": ")
    ami.image_id
  end
end
