require 'json'
require 'singleton'
 class CommentCheck
	include Singleton
		def call(text, wordselection)
        sentiment = analyze(text, wordselection, total=0)
        sentiment[:type] = sentiment_type(sentiment[:total])
		sentiment
		end
	
		def analyze(review, wordselection, total)
		#Empty array for results
		result = Array.new
		
		#Split review into sepearte words
		words = review.split
		#Then for every word check if that word exists in the JSON file of words
		words.each do |word|
		  
		  score = wordselection[word].to_f
		  total += score
		  result << { key: word, score: total}
		end

		{ results: result, total: total }
		
	  end
	  
	  def sentiment_type(total)
      case
      when total < 0
        'Negative'
      when total == 0
        'Neutral'
      when total > 0
        'Positive'
      end
	end

	  
	  def load_file(file)
		file = JSON.parse(File.read(file))
		return file
	end
end



