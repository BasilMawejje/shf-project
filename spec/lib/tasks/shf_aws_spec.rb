require 'rails_helper'

Rails.application.load_tasks

RSpec.describe 'shf::aws rake tasks', type: :task do
  describe 'copy old backups to new prefix names' do
    let(:first_date) {'2021-07-01'}
    let(:last_date) {'2021-08-02'}

    it 'it copies old backups to new prefix names' do
      expect(Rake::Task['shf:aws:copy_to_new_prefixes']).to receive(:invoke).with(first_date, last_date)
      Rake::Task['shf:aws:copy_to_new_prefixes'].invoke(first_date, last_date)
    end
  end

  describe 'apply date tags to prefixed backups' do
    let(:first_date) {'2021-07-01'}
    let(:last_date) {'2021-08-02'}

    it 'it applies date tags to prefixed backups' do
      expect(Rake::Task['shf:aws:apply_date_tags']).to receive(:invoke).with(first_date, last_date)
      Rake::Task['shf:aws:apply_date_tags'].invoke(first_date, last_date)
    end
  end

  describe 'add lifecycle rules to s3 bucket' do
    it 'it adds lifecycle config to s3 bucket' do
      expect(Rake::Task['shf:aws:bucket_lifecycle_config']).to receive(:invoke)
      Rake::Task['shf:aws:bucket_lifecycle_config'].invoke
    end
  end
end