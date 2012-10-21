watch( 'spec/.*_spec\.rb' ) { |md| system "bundle exec rspec -I spec/ #{md[0]}" }
watch( 'spec/(support|factories)/.*\.rb' ) { |md| system 'bundle exec rspec -I spec/ spec/' }
watch( 'app/(.*)\.rb' ) { |md| system "bundle exec rspec -I spec/ spec/#{md[1]}_spec.rb" }
watch( '(lib/.*)\.rb' ) { |md| system "bundle exec rspec -I spec/ spec/#{md[0]}_spec.rb" }
