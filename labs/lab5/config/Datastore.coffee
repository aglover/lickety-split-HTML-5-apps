mongo = require 'mongoskin'

db = mongo.db('mongodb://metrics:metrics@flame.mongohq.com:27036/metrics', {safe:false})

db.bind 'words', {
	recentlyCreated: (fn) ->
		this.find({}, {limit:10, sort:[['_id', -1]]}).toArray(fn)
}

exports.datastore = db