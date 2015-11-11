# this is my library for text manipulation
class WordPlay
#switching subject and object pronouns
	def self.switch_pronouns(text)	#accepts a text supplied as a string
		text.gsub(/\b(I am|You are|I|You|Me|Your|My)\b/i) do |pronoun|	#substitute every instance of enclosed within \b\b and does pronoun
			case pronoun.downcase
				when "i"
					"you"
				when "you"
					"me"
				when "me"
					"you"
				when "i am"
					"you are"
				when "you are"
					"i am"
				when "your"
					"my"
				when "my"
					"your"
			end
		end.sub(/^me\b/i, 'i')
	end

#best sentence picker
	def self.best_sentence(sentences, desired_words)
		ranked_sentences=sentences.sort_by do |s|
			s.words.length - (s.downcase.words - desired_words).length
		end

		ranked_sentences.last
	end
end

class String
	def sentences
		gsub(/\n|\r/, ' ').split(/\.\s*/)	#substitutes new lines(\n|\r) with space 
											#then splits text into sentences based on existing periods and white space(\.\s*)
	end
	
	def words
		scan(/\w[\w\'\-]*/)	#scans and converts the input into words(\w*) everything including words(w with ' and -)
	end

end

#testing sentence splitting method
#p %q(Hello. This is a test of basic sentence splitting. It even works over multiple lines.).sentences

#testing words splitting method
#p "This is a test of words' capabilities".words

#testing both by picking 4th word in the 1st sentence
#p %q{Hello. This is a test of basic sentence splitting. It even workds over multiple lines}.sentences[1].words[3]

#word matching: defined 2 hot words and then find if my_string has any of the hot words
hot_words=%w{test ruby}
my_string="This is a test. Dull sentence here. Ruby is great. So is cake."
my_string.sentences.find_all do |s|
	s.downcase.words.any? {|word| hot_words.include?(word)}
end

