require 'json'

current_dir = Dir.pwd
soundpack_path = ARGV[0]
config_path = "#{current_dir}/#{soundpack_path}/config_old.json"
config = JSON.parse(File.read(config_path))
ext = config['sound'].split('.').last

config['defines'].each_with_index do |(key, value), i|
	next unless value

	start_time = value[0] / 1000.0
	duration = value[1] / 1000.0

	puts "================== #{i} #{start_time} #{duration}"

	`ffmpeg \
		-i "#{current_dir}/#{soundpack_path}/#{config['sound']}" \
		-ss #{start_time} \
		-t #{duration} \
		-c copy "#{current_dir}/#{soundpack_path}/#{key}.#{ext}" \
		-y`

	config['defines'][key] = "#{key}.#{ext}"
end

config['key_define_type'] = 'multiple'
File.write("#{current_dir}/#{soundpack_path}/config.json", config.to_json)