_path("/root/.gitconfig") do
  content '[credential]
helper = !aws --region us-east-1 codecommit credential-helper $@
UseHttpPath = true
[user]
email = amimoto@example.com
name = Amimoto CodeDeploy
  '
  mode "00644"
  owner "root"
  group "root"
end
