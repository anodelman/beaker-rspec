require 'beaker-rspec'

describe "ignore" do

  example "ignore" do
    hosts.each do |host|
      on host, 'echo hello'
    end
  end

end
