node default {
   include sysmon
   notify {"Testing puppet apply":}
#  class { 'zookeeper': 
#    repo   => 'cloudera',
#    cdhver => '5',
#    initialize_datastore => true,
#    install_java => true,
#    java_package => 'java-1.8.0-openjdk-headless',
#    client_ip => '0.0.0.0'
#  }
#  class { 'kafka::broker':
#    config => { 'broker.id' => '0', 'zookeeper.connect' => 'localhost:2181' }
#  }
}
