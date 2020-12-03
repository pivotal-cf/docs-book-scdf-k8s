# Redirect all production http traffic to https
r301 %r{.*}, 'https://docs.pivotal.io$&', :if => Proc.new { |rack_env|
  rack_env['SERVER_NAME'] == 'docs.pivotal.io' && rack_env['HTTP_X_FORWARDED_PROTO'] == 'http'
}

r301 %r{/scdf-k8s/(?![\d-]+)(.*)}, "/scdf-k8s/1-1/$1"

# Add subdirectory for Pro Features
r301 '/scdf-k8s/1-2/multi-io-support.html', '/scdf-k8s/1-2/pro-features/multi-io-support.html'
r301 '/scdf-k8s/1-2/container-registry-updates.html', '/scdf-k8s/1-2/pro-features/container-registry-updates.html'
