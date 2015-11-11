#----------------------------
#Reads the text file and spits out the entire text in the console
#	File.open("Oliver.text").each { |line| puts line }	#--files in the same dir
#-----------------------------

#----------------------------
#Reads the text file,  counts how many lines are there and spits out the count
#	line_count=0
#	File.open("Oliver.txt").each {|line| line_count += 1}
#	puts line_count
#---------------------------

#---------------------------
#Reads the text file, creates a single string with it line per line, counts the lines while at it and spits out the count of the lines
#The Long Way
#	text=''
#	line_count=0
#	File.open("Oliver.txt").each do |line| 
#		line_count += 1
#		text << line
#	end
#	puts "#{line_count} lines"
#----------------------------
#The Short Way
lines = File.readlines(ARGV[0])
line_count = lines.size
text = lines.join
puts"#{line_count} lines in this text file"
#---------------------
#Counts the characters
total_characters = text.length
puts "#{total_characters} characters in this text file"
#---------------------
#Counts the characters but without the spaces now
total_characters_nospaces = text.gsub(/\s+/, '').length
puts "#{total_characters_nospaces} characters excluding spaces in this text file"
#-------------------
#Counts the words
word_count = text.scan(/\w+/).length
puts "#{word_count} words in this text file"
#-----------------
#Counts paragraphs and sentences
paragraph_count = text.split(/\n\n/).length
sentence_count = text.split(/\.|\?|!/).length
puts "#{paragraph_count} paragraphs in this text file"
puts "#{sentence_count} sentences in this text file"
#---------------------
#Average sentences per paragraph and words per sentence
puts "#{sentence_count/paragraph_count} sentences per paragraph (average)"
puts "#{word_count/sentence_count} words per sentence (average)"
#---------------------
#Array of stop words
stopwords = %w{the a by on for of are with just but and to the my I has some in}
# Make a list of words in the text that aren't stop words,
# count them, and work out the percentage of non-stop words
# against all words
all_words = text.scan(/\w+/)
good_words = all_words.select{ |word| !stopwords.include?(word) }
good_percentage = ((good_words.length.to_f / all_words.length.to_f) * 100).to_i

# Summarize the text by cherry picking some choice sentences
sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
sentences_sorted = sentences.sort_by { |sentence| sentence.length }
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }
puts "#{good_percentage}% of words are non-fluff words"
puts "Summary:\n\n" + ideal_sentences.join(". ")
puts "-- End of analysis"
#End of Code
