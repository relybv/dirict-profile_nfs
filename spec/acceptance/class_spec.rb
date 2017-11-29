if ENV['BEAKER'] == 'true'
  # running in BEAKER test environment
  require 'spec_helper_acceptance'
else
  # running in non BEAKER environment
  require 'serverspec'
  set :backend, :exec
end

describe 'profile_nfs class' do

  context 'default parameters' do
    if ENV['BEAKER'] == 'true'
      # Using puppet_apply as a helper
      it 'should work with no errors' do
        pp = <<-EOS
        class { 'profile_nfs': }
        EOS

        # Run it and test for errors
        apply_manifest(pp, :catch_failures => true)
      end
    end

    describe package('nfs-kernel-server') do
      it { is_expected.to be_installed }
    end

    describe service('nfs-kernel-server') do
      it { is_expected.to be_enabled }
    end

    describe port(2049) do
      it { should be_listening.with('tcp') }
      it { should be_listening.with('udp') }
    end

    describe port(111) do
      it { should be_listening.with('tcp') }
      it { should be_listening.with('udp') }
    end

    describe file('/mnt/nfs') do
      it { should be_directory }
    end

    describe file('/mnt/nfs/office-templates') do
      it { should be_directory }
    end

    describe file('/mnt/nfs/config') do
      it { should be_directory }
    end

    describe file('/mnt/nfs/errors') do
      it { should be_directory }
    end

    describe file('/mnt/nfs/logs') do
      it { should be_directory }
    end

    describe file('/mnt/nfs/data') do
      it { should be_directory }
    end

    describe file('/mnt/nfs/data/cache') do
      it { should be_directory }
    end

    describe file('/mnt/nfs/data/tmp') do
      it { should be_directory }
    end


  end
end
