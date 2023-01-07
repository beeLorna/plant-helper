class Plant < ActiveYaml::Base
  set_root_path "data/plants"
  use_multiple_files
  set_filenames "1"
end