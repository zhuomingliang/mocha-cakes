colors = require 'colors'

exports.Feature = (feature, story..., callback)->
	#  exp. Feature 'new feature', 'in order to do good', 'as a user', 'I want to do good', ->
	# message = "Feature: #{feature} \n\n\t#{benefit}\n\t#{who}\n\t#{desire}"

	message = "Feature: #{feature} \n".green.underline
	(message += '\n\t'+part for part in story)

	describe(message, callback)
	return

depict = (label, args)->
	if args.length == 1
		args[1] = args[0]
		label = ''

	describe label.replace('%s', args[0]), args[1]

exports.Background = (action, callback)->
	depict "\n   Background: #{action}".magenta, arguments

exports.Scenario = ->
	depict "\n    Scenario: %s".green, arguments

exports.Given = ->
	depict "Given: %s", arguments

exports.When = ->
	depict " When: %s", arguments

exports.And = ->
	depict "  and %s", arguments

exports.Then = ->
	depict " Then: %s", arguments

exports.But = ->
	depict " But %s", arguments

# Add function names to global scope.
(global[name] = func for name, func of module.exports)
