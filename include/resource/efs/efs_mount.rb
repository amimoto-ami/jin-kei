EFSMoutTarget do
	Type "AWS::EFS::MountTarget"
	Properties do
		FileSystemId do
			Ref "EFSFileSystem"
		end
		#IpAddress
		SecurityGroups [
			_{ Ref "SecurityGroupFileSystem" }
		]
		SubnetId do
			Ref "PublicSubnet"
		end
	end
end
