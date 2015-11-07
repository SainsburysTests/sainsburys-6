log "Checking out app from github"
git "/opt/go/src" do
  repository "https://github.com/completerevolution/sainsburys-app.git"
     action :checkout
end

log "Manually compiling go app"
bash "compile_app" do
  user 'root'
  code <<-EOF
    cd /opt/go/src
    go build app.go
    mv /opt/go/src/app /opt/go/bin/app
    rm /opt/go/src/app.go
    EOF
end

log "Executing the compiled app, and placing it in the background with &"
execute 'sainsburys_app' do
  command '/opt/go/bin/app &'
end
