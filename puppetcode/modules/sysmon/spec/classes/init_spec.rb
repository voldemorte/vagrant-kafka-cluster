require 'spec_helper'
describe 'sysmon' do
  context 'with default values for all parameters' do
    it { should contain_class('sysmon') }
  end
end
