class Disease < ActiveYaml::Base
  set_root_path "data/diseases"
  use_multiple_files
  set_filenames "all"
end
