class TextAnalyzer
  def process
    file = File.open('sample.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new

analyzer.process do |text|
  puts "paragraphs: #{text.scan(/\n\n/).count + 1}"
end

analyzer.process do |text|
  puts "lines: #{text.scan(/\n/).count}"
end

analyzer.process do |text|
  puts "words: #{text.split(" ").count}"
end
