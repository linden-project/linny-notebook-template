desc "release"
task :release, [:new_version] do |task, args|
  if args[:new_version]
    git_release(args[:new_version])
  else
    puts "Error: Version number required\n"
    puts
    puts "Usage: to release a new version run: rake release[0.0.0]"
  end
end

def git_release(new_version)

  name = File.basename(Dir.getwd)
  message = "Bumped version number to v#{new_version}." # unless message = ARGV[1]
  puts "git commit -am \"#{message}\""
  `git commit -am "#{message}"`
  `git push`
  puts "git tag -a v#{new_version} -m \"#{name} v#{new_version}\""
  `git tag -a v#{new_version} -m "#{name} v#{new_version}"`
  puts "git push origin v#{new_version}"
  `git push origin v#{new_version}`
end
