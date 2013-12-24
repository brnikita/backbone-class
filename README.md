Backbone Class
====================

Class is the missing "Backbone.Class" in Backbone.js.  It provides clean JavaScript inheritence via the Backbone.extend pattern and modified via https://github.com/lukasolson/Backbone-Super for simple `this._super()` calls.  On instantiation, an initialize method is called and if a parameters object is passed, unless overridden, it will be pushed on to an `options` hash.  Additionally, because backbone-class extends Backbone.Events, event dispatch can be achieved by adding listeners, triggering events, and removing listeners per the Backbone.js spec.

Best used with Browserify! https://github.com/substack/node-browserify

Installation
------------
- `npm install backbone-class`

Tests
-----

- `npm install -g grunt-cli`
- `npm install`
- `npm test`


Example
-------

**Inheritence**

```
var Klass = require('backbone-class')

var Person = Klass.extend({
  language: function() {
    return 'The method of human communication, either spoken or written, consisting of the use of words in a structured and conventional way.'
  }
})

var Animal = Person.extend({
  meaning: function() {
    return 'Intended to communicate something that is not directly expressed.'
  }
})

var animal = new Animal({
  defaultLanguage: 'Bark'
})

console.log( animal.options.defaultLanguage )
console.log( animal.language() )
console.log( animal.meaning() )

```

**Supers**

```
var Person = Klass.extend({
  language: function (lang) {
    return 'Speaking ' + (lang || 'English')
  }
})

var person = new Person()
console.log( person.language() ) // 'Speaking English'

var Animal = Person.extend({
  language: function(lang) {
    this._super(lang)
  }
})

var animal = new Animal()

console.log( animal.language('Bark') ) // 'Speaking Bark'

```

**Eventing**

```
var Person = Klass.extend({
  initialize: function() {
    this.on('speak', this.onSpeak.bind(this))
  },

  onSpeak: function() {
    return 'Hello Human :)'
  }
})

var person = new Person()
person.trigger('speak')

```

More Info
----------

Class inheritance mirrors Backbone.js precisely, but without the additional method baggage that is normally associated with Models, Views and Collections; feel free to check out http://backbonejs.org/ for more info.  Also, see https://github.com/lukasolson/Backbone-Super for more info on the _super() method.


Thanks
-------

- http://backbonejs.org/
- https://github.com/lukasolson/Backbone-Super
