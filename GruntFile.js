/**
 * Base grunt file for Mocha tests
 *
 * Primary Tasks:
 *   grunt test  :  Execute mocha tests
 *   grunt       :  Development mode, file-watcher
 */


module.exports = function( grunt ) {

  grunt.initConfig({


    // + ---------------------------------------


    'simplemocha': {
      options: {
        ui: 'bdd',
        reporter: 'spec',
        compilers: 'coffee:coffee-script',
        bail: true
      },

      all: {
        src: ['test/spec-runner.coffee']
      }
    },


    'umd': {
      package: {
        src: './src/backbone-simpleclass.js',
        dest: './lib/backbone-simpleclass.js',
        deps: {
          'default': ['Backbone', '_']
        }
      }
    },


    'watch': {
      src: {
        files: [ 'src/**', 'test/**' ],
        tasks: [ 'simplemocha' ]
      }
    }

  })


  // + ---------------------------------------


  grunt.registerTask( 'default', [
    'test',
    'watch'
  ])

  grunt.registerTask( 'test', [
    'simplemocha'
  ])

  grunt.registerTask( 'build', [
    'test',
    'umd'
  ])


  // + ---------------------------------------


  grunt.loadNpmTasks( 'grunt-contrib-watch' )
  grunt.loadNpmTasks( 'grunt-simple-mocha' )
  grunt.loadNpmTasks( 'grunt-umd' )


  // + ---------------------------------------


  grunt.option( 'force', true )


}
