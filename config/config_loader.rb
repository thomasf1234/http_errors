class ConfigLoader
  class << self
    def load_yaml file_path
      YAML.load(file_contents(file_path)).to_hash
    end

    private

    def file_contents file_path
      file = File.open(file_path)
      file_contents = file.read
      file.close
      file_contents
    end
  end
end
