require 'csv'
require 'carrierwave/orm/activerecord'
require 'rubygems'
require 'zip'
require 'zip/zipfilesystem'

class UserDataFile < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  validates :filename, uniqueness: {message: "Duplicated File!"}

  def zipfile=(incoming_file)
    value_array = []
    value_array  = incoming_file.split("\n")
   

    array_element = []
    array_element = value_array[1].split(",")
    
    android_id = array_element[0]
    time_stamp = array_element[1][0...-3]

    time = Time.at(time_stamp.to_i).utc
    filename = ("#{android_id}".to_s + "__AT__" + "#{time}".to_s).gsub(/\W/,'_') + ".csv"
    folder = "public/"
    input_filenames ||= []
    input_filenames << filename
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

  private
  def sanitize_filename(filename)
    #get only the filename, not the whole path (from IE)
    just_filename = File.basename(filename)
    #replace all non-alphanumeric, underscore or periods with underscores
    just_filename.gsub(/[^\w\.\-]/, '_')
  end
end
