#! /usr/bin/ruby

def system(str)
	puts str
	Kernel.system str
end

EXT_WHITELIST = [
	".pbxproj",
	".xcworkspacedata",
	".xcscheme",
	".h",
	".m",
	".xml",
	".plist",
	".xib",
]

def findReplaceInDirectory(find, replace, dir)
	Dir.glob("#{dir}/*") do|elt|
		if elt.include?(find)
			rename = elt.gsub(find, replace)
			system "git mv '#{elt}' '#{rename}'"
			
			elt = rename
		end
		
		if File.file?(elt) and EXT_WHITELIST.include?(File.extname(elt))
			# Workaround for a bizarre non-source file in the Cocos2D tree.
			next if File.basename(elt) == "CCPackageTest.m"
				
#			system "grep -l '#{find}' '#{elt}'"
#			system "sed -i '' 's/#{find}/#{replace}/g' '#{elt}'"
			
			# sed messes up symlinks and files without newlines at the end.
			contents = File.read(elt)
			replaced = contents.gsub(find, replace)
			if contents != replaced
				puts "Updating #{elt}"
				
				file = open(elt, "w")
				file.write replaced
				file.close
				
				system "git add '#{elt}'"
			end
		end
		
		if File.directory?(elt)
			findReplaceInDirectory(find, replace, elt)
		end
	end
end


dir = File.dirname(__FILE__)
projname = File.basename(File.absolute_path(dir))

if projname == "UnofficialCocos2DTemplate"
	print "What would you like to name your project? "
	rename = gets.chomp
	
	abs = File.absolute_path(dir)
	system "mv '#{abs}' '#{File.dirname(abs)}/#{rename}'"
	projname = rename
end

# Split up the search names so that the search won't find them.
findReplaceInDirectory("PROJECT" + "NAME", projname, dir)
findReplaceInDirectory("PROJECT" + "IDENTIFIER", projname, dir)

system "git rm '#{__FILE__}'"
system "git rm '#{dir}/ResetName.sh'"

puts "Renaming complete. Please review and commit the changes."
