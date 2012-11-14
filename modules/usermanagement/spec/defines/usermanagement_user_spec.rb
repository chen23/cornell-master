require 'spec_helper'

describe 'usermanagement::user', :type => :define do
  context "For a root user" do
    let :title do
      'root'
    end
    let :params do
      {
        :ensure => 'present'
      }
    end

    it "should fail to manage root" do
      expect { subject.should contain_user('root') }.to raise_error Puppet::Error
    end
  end

  context "For a normal user" do
    let :title do
      'elvis'
    end
    let :params do
      {
        :ensure => 'present'
      }
    end

    it { should contain_user('elvis') }
    it { should contain_group('elvis') }
    it { should contain_file('/home/elvis').with({
      :owner => 'elvis',
      :group => 'elvis',
    } ) }
  end

  context "For a user with homedir and group params" do
    let :title do
      'hunner'
    end
    let :params do
      {
        :ensure  => 'present',
        :homedir => '/var/lib/hunner',
        :group   => 'elvis',
      }
    end

    it { should contain_user('hunner') }
    it { should contain_group('elvis') }
    it { should contain_file('/var/lib/hunner').with({
      :owner => 'hunner',
      :group => 'elvis',
    } ) }
  end

  context "For an absent user" do
    let :title do
      'quux'
    end
    let :params do
      {
        :ensure  => 'absent',
      }
    end

    it { should contain_user('quux').with({
      :ensure => 'absent'
    } ) }
    it { should_not contain_group('quux') }
    it { should_not contain_file('/home/quux') }
  end
end
