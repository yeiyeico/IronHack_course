# objeto de llamado y general
class Srt_timeshift

	def initialize(file, addtime)
		@file = file
		@addtime = addtime
	end

	def file_writer 
		file_reader = IO.read(@file)
		
		file_reader.each_line do |line|
			if line.include?('-->')
				timeFrame = TimeFrame.new(line)
				timeFrame.shift(@addtime)
				puts timeFrame.to_s
			else
				puts line
			end
		end
	end
end

# objeto para partir la linea de tiempo en 2 secciones

class TimeFrame
	def initialize (times)
		splitted = times.split('-->')
		@first_time = Splittedtime.new(splitted[0])
		@last_time = Splittedtime.new(splitted[1])
	end

	def shift (time)
		@first_time.shift(time)
		@last_time.shift(time)
	end

	def to_s
		@first_time.to_s + '-->' + @last_time.to_s
	end

end

# objeto de cambio de hora min sec, and milisecs
class Splittedtime
	def initialize (time)
		@hour = time.slice(0,1).to_i
		@min = time.slice(3,4).to_i
		@sec = time.slice(6,7).to_i
		@milisec = time.slice(10,12).to_i
	end	

	def shift (time)
		@milisec += time % 1000
		if @milisec > 1000
			@sec += 1
			@milisec -=1000
		end
		@sec += time / 1000
	end

	def to_s
		"%02d" % @hour.to_s + ":" + 
		"%02d" % @min.to_s + ":" + 
		"%02d" % @sec.to_s + "," + 
		"%03d" % @milisec.to_s
	end
end


try01 = Srt_timeshift.new('subtitles.srt', 7)

try01.file_writer

