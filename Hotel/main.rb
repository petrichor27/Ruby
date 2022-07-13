def yaml_to_file(file,yaml)
  File.open(file,"w") do |f|
    f.puts yaml
  end
end


