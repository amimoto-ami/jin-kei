EFSFileSystem do
	Type "AWS::EFS::FileSystem"
	Properties do
		FileSystemTags [
			_{
				Key "Name"
	            Value do
	              Ref "AWS::StackName"
	            end
			}
		]
	end
end
