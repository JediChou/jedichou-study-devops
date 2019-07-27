# File name: rl.rb
# Create date: 2013-9-23 17:32 PM
# Update date: 2013-9-29 08:35 AM
# Description: Source code line counter.
# Version : V-e-2.71
# Status: Main function complete, need 

require 'find'
require 'time'
  
def getFilelist(path)
  	filelist = []
	Find.find(path) do |f| 
      	type = "File" if File.file?(f)
     	# type  = "Dir " if File.directory?(f)
        if type == "File"
        	filelist.push(f)
        end 
	end
	filelist
end

def counted(file)
	fileType = [
		'aspx', 'cs', 			# CSharp, ASP.NET
		'c', 'cpp', 'cc', 'h',	# C++, C
		'fs',					# Fsharp
		'go',					# Google Go
		'groovy',				# groovy
		'hla',					# High Level Assemble
		'html', 'htm',			# Web page
		'js',					# JavaScript
		'java',					# Java
		'lua',					# Lua
		'm',					# Matlab
		'php', 'php3', 'php4',	# PHP
		'ps1',					# PowerShell
		'vbs',					# VBScript
		'py',					# Python
		'r', 'R',				# R
		'rb',					# Ruby
		'sql',					# SQL Script
		'tcl'					# TCL Script
	]
	fileType.include?(file.split(".")[-1])
end

def getFLines(file)
	File.foreach(file).inject(0) {|c, line| c+1}
end

def getCodelife()
	from = Time.mktime(1978,6,3)
	to   = Time.now - 86400
	result = (to.to_i - from.to_i) / 86400
end

######################### Program Start Here #########################
# 1. Get file list
# 2. Check list by file
# 	2.1 if file name in the excepted, print it and it's line counter
# 3. At last print total counter
def main()
	targetDirectory_FileList = getFilelist("E:/mysrc")
	targetDirectory_TotalLine = 0
	needed = getCodelife()*300

	targetDirectory_FileList.each { |file|
		if counted(file)
			tmpCount = getFLines(file)
			puts "#{file}, lines: #{tmpCount}"
			targetDirectory_TotalLine += tmpCount
		end
	}
	
	puts ""
	puts "All total code lines: [#{targetDirectory_TotalLine}]" 
	puts "Need code line is   : [#{needed-targetDirectory_TotalLine}]"
	puts "Code life for today : [#{getCodelife()}]"
	puts "Need code days      : [#{(needed-targetDirectory_TotalLine)/300}]"
end

main()
