class Question < ActiveYaml::Base
  set_root_path "data/questions"
  use_multiple_files
  set_filenames "1"
end
