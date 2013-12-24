Klass  = require '../lib/Klass'
_      = require 'underscore'
chai   = require 'chai'
expect = chai.expect


describe 'Klass', ->


   it 'Should provide a simple class inheritance structure', ->

      Person = Klass.extend
         language: ->
            'Space > '

      Animal = Person.extend
         meaning: ->
            'Structure'

      animal = new Animal()

      msg = animal.language() + animal.meaning()

      expect(msg).to.equal 'Space > Structure'



   it 'Should apply provided instantiation options onto an options hash', ->

      Person = Klass.extend
         initialize: (options) ->
            @_super(options)


      person = new Person({ canSpeak: true })

      expect(person.options.canSpeak).to.equal true



   it 'Should call super methods via this._super()', ->

      Person = Klass.extend
         setLanguage: (language) ->
            @language = "Supernatural #{language}"

      Animal = Person.extend
         setLanguage: (language) ->
            @_super("Space #{language}")


      animal = new Animal()
      animal.setLanguage('Music')

      expect(animal.language).to.equal 'Supernatural Space Music'


