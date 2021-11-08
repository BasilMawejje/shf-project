desc 'rake task that removes all nil Paperclip file objects'
task :cleanup_nil_paperclip_files => :environment do
  UploadedFile.where(actual_file_file_size: nil).destroy_all
end