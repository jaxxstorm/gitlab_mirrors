require 'spec_helper'
require 'shared_contexts'

describe 'gitlab_mirrors::install' do
    # by default the hiera integration uses hirea data from the shared_contexts.rb file
    # but basically to mock hiera you first need to add a key/value pair
    # to the specific context in the spec/shared_contexts.rb file
    # Note: you can only use a single hiera context per describe/context block
    # rspec-puppet does not allow you to swap out hiera data on a per test block
    include_context :hiera


    # below is the facts hash that gives you the ability to mock
    # facts on a per describe/context block.  If you use a fact in your
    # manifest you should mock the facts below.
    let(:facts) do
        {:id => 'root'}
    end
    # below is a list of the resource parameters that you can override
    # by default all non-required parameters are commented out
    # while all required parameters will require you to add a value
    let(:params) do
        {
        }
    end
    # add these two lines in a single test block to enable puppet and hiera debug mode
    # Puppet::Util::Log.level = :debug
    # Puppet::Util::Log.newdestination(:console)
    it { is_expected.to contain_package('gitlab3').with_provider('pip').with_ensure('0.5.4') }
end
