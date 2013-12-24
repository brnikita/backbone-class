Klass  = require '../lib/backbone-class'
_      = require 'underscore'
chai   = require 'chai'
expect = chai.expect


describe 'Klass', ->


   it 'Should provide a simple class inheritance structure', ->

      Person = Klass.extend
         language: ->
            'A > '

      Animal = Person.extend
         meaning: ->
            'B'


      animal = new Animal()

      msg = animal.language() + animal.meaning()

      expect(msg).to.equal 'A > B'



   it 'Should apply provided instantiation options onto an options hash', ->

      Person = Klass.extend
         initialize: (options) ->
            @_super(options)


      person = new Person({ canSpeak: true })

      expect(person.options.canSpeak).to.equal true



   it 'Should call super methods via this._super()', ->

      Person = Klass.extend
         setLanguage: (language) ->
            @language = "A > #{language}"

      Animal = Person.extend
         setLanguage: (language) ->
            @_super("B > #{language}")


      animal = new Animal()
      animal.setLanguage('C')

      expect(animal.language).to.equal 'A > B > C'



   it 'Should be overridable', ->

      Person = Klass.extend
         setLanguage: ->
            @language = 'French'

      Animal = Person.extend
         setLanguage: ->
            @langauage = 'German'


      animal = new Animal()

      expect(animal.setLanguage()).to.equal 'German'


