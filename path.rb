#!/usr/bin/env ruby

def directory_path_hash(path, name = nil)
 hash = {:name => (name || path)}
  hash[:children] = children = []
  Dir.foreach(path) do |entry|
    if entry == '..' || entry == '.'
      next
    end
    full_path = File.join(path, entry)
    if File.directory?(full_path)
      children << directory_path_hash(full_path, entry)
    else
      children << entry
    end
  end
  return hash 
end

Dir.chdir("/home/rocco/")
path = "Dokumente"
path_hash = directory_path_hash(path)
puts path_hash 
