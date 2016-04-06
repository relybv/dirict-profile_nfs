require 'spec_helper'

describe 'profile_nfs' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts.merge({
            :concat_basedir => "/foo"
          })
        end

        context "profile_nfs class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('profile_nfs') }

          it { is_expected.to contain_class('profile_nfs') }

          it { is_expected.to contain_nfs__server__export('/mnt/nfs') }
  

        end
      end
    end
  end
end
