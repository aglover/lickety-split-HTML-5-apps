String::capitalize = ->
	"#{this.charAt(0).toUpperCase()}#{this.slice(1)}"

String::periodize = ->
	if this.slice(-1) isnt '.'
		"#{this}."
	else
		this