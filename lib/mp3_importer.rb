class MP3Importer
  attr_reader :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end
  
  # def files
  #   Dir.entries(path).select {|e| e.end_with?('.mp3')}
  # end
  
  def import
    files.each {|some_filename| Song.new_by_filename(some_filename)}
  end  
end