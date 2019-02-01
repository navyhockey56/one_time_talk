require 'date'

Gem::Specification.new do |spec|
  spec.name = 'one_time_talk'
  spec.version = 0.1
  spec.date = Date.today.to_s
  spec.summary = "One time pad communication perpetuated."
  spec.authors = ["Will Dengler"]
  spec.files = Dir["lib/**/*.rb"]

  spec.add_dependency 'pry'

end
