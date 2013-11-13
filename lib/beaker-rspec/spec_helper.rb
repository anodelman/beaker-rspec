require 'beaker-rspec/beaker_shim'
include BeakerRSpec::BeakerShim

RSpec.configure do |c|
  # Enable color
  c.tty = true

  # Define persistant hosts setting
  c.add_setting :hosts

  # Defined target nodeset
  nodeset = ENV['RSPEC_SET'] || 'sample.cfg'
  preserve = ENV['RSPEC_DESTROY'] ? '--preserve-hosts' : ''
  fresh_nodes = ENV['RSPEC_PROVISION'] ? '' : '--no-provision'

  # Configure all nodes in nodeset
  c.setup([preserve, fresh_nodes, '--type','git','--hosts', nodeset])
  c.provision
  c.validate

  # Destroy nodes if no preserve hosts
  c.after :suite do
    c.cleanup
  end
end
