require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'
require 'worker'

include Clockwork

every( 1.minute, "Running codes!") do
  Delayed::Job.enqueue Worker.new
end