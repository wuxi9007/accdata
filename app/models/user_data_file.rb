require 'csv'
require 'carrierwave/orm/activerecord'
require 'rubygems'
require 'zip'
require 'zip/zipfilesystem'

class UserDataFile < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  validates :filename, uniqueness: {message: "duplicate file!"}

  def uploaded_file=(incoming_file)
    CSV.foreach(incoming_file.path, headers: true) do |row|
      android_id = row[1]
      time = row[2][0...-3]
      time = Time.at(time.to_i).utc
      self.filename = "#{android_id}".to_s + "__AT__" + "#{time}".to_s
    end
  end

  def zipfile=(incoming_file)
    folder = "public/uploads/user_data_file/avatar"
    input_filenames ||= []
    input_filenames << incoming_file.original_filename
    zipfile_name = "public/AllData.zip"
    Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
        input_filenames.each do |filename|
          # Two arguments:
          # - The name of the file as it will appear in the archive
          # - The original file, including the path to find it
          zipfile.add(filename, folder + '/' + filename)
        end
      zipfile.get_output_stream("ignore") { |os| os.write "myFile contains just this" }
    end
  end


  def filename=(new_filename)
    write_attribute("filename", sanitize_filename(new_filename))
  end

  private
  def sanitize_filename(filename)
    #get only the filename, not the whole path (from IE)
    just_filename = File.basename(filename)
    #replace all non-alphanumeric, underscore or periods with underscores
    just_filename.gsub(/[^\w\.\-]/, '_')
  end
end
