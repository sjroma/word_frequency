class Wordfreq
  STOP_WORDS = ['a', 'an', 'and', 'are', 'as', 'at', 'be', 'by', 'for', 'from',
    'has', 'he', 'i', 'in', 'is', 'it', 'its', 'of', 'on', 'that', 'the', 'to',
    'were', 'will', 'with']

  def initialize(filename)
		@filename = filename
		
		@words = File.read(@filename).strip.downcase.gsub(/\W+/, ' ').split.delete_if{|x| STOP_WORDS.include?(x)}
#		p @words
		
		@frequencies = frequencies
		puts @frequencies
  end

  def frequency(word)
		@frequencies
  end

  def frequencies
		frequencies = Hash.new(0)
		@words.each do |word|
		frequencies[word] += 1
    end
		frequencies
  end

  def top_words(number)
  end

  def print_report
  end
end

if __FILE__ == $0
  filename = ARGV[0]
  if filename
    full_filename = File.absolute_path(filename)
    if File.exists?(full_filename)
      wf = Wordfreq.new(full_filename)
      wf.print_report
    else
      puts "#{filename} does not exist!"
    end
  else
    puts "Please give a filename as an argument."
  end
end
