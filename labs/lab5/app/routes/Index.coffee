WordModel = require '../models/Word'

module.exports = (db) ->
	index: (req, res) -> # '/'
		db.words.recentlyCreated (err, tenWords) ->
			if err
				console.log "eror is #{err}"
			else
				allWords = []
				for iwrd in tenWords
					allWords.push new WordModel.Word(iwrd._id, 
						iwrd.spelling.capitalize(), 
						iwrd.definitions[0].definition.capitalize(),
						iwrd.definitions[0].part_of_speech.capitalize(),
						iwrd.definitions[0].example_sentence.capitalize().periodize())

				res.render 'index', {words: allWords}

		