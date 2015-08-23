class GraphParser
  def initialize(file_path)
    @content_file = File.read(file_path)
  end

  def vertices
    @content_file.scan(/[[:upper:]]/).uniq.sort
  end

  def edges
    @content_file.scan(/\w{3}/)
  end
end

