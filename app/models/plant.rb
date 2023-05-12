class Plant < ActiveYaml::Base
  set_root_path "data/plants"
  use_multiple_files
  set_filenames "1", "2", "3", "4", "5", "6", "11", "12", "13", "14", "15", "16"
end
