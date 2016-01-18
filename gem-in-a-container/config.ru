require 'rubygems'
require 'geminabox'

Geminabox.data = ENV['DATA_DIR']
Geminabox.rubygems_proxy = ENV['RUBYGEMS_PROXY'] && ENV['RUBYGEMS_PROXY'].downcase.strip == 'true'
Geminabox.allow_remote_failure = ENV['ALLOW_REMOTE_FAILURE'] && ENV['ALLOW_REMOTE_FAILURE'].downcase.strip == 'true'
Geminabox.build_legacy = ENV['BUILD_LEGACY'] && ENV['BUILD_LEGACY'].downcase.strip == 'true'

run Geminabox::Server
