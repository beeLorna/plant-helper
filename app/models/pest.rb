class Pest < ActiveYaml::Base
  set_root_path "data/pests"
  use_multiple_files
  set_filenames "all"
end
