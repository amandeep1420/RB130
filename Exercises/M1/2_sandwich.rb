

class TextAnalyzer
  def process
    text       = File.read('sample_text.txt')
    split_text = text.split(/\n/)
    p split_text.size
    # puts text    
  end
end

analyzer = TextAnalyzer.new.process
# analyzer.process { # your implementation }
# analyzer.process { # your implementation }
# analyzer.process { # your implementation }