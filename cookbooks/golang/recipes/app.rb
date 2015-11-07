log "Checking out app from github"
git "/opt/go/src" do
  repository "https://github.com/completerevolution/sainsburys-app.git"
     action :checkout
end

bash "compile_app" do
  user 'root'
  code <<-EOF
    cd /opt/go/src
    go build app.go
    mv /opt/go/src/app /opt/go/bin/app
    rm /opt/go/src/app.go
    EOF
end

execute 'sainsburys_app' do
  command '/opt/go/bin/app &'
end
