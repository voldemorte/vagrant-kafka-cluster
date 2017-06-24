class sysmon::cron {
   package { "elinks": ensure => present }

   file { "/usr/local/sbin/sysmon":
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      source => "puppet:///modules/sysmon/sysmon.sh",
      ensure  => present,
   }
   file { "/etc/cron.d/sysmon":
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      source  => "puppet:///modules/sysmon/sysmon.cron",
      require => File["/usr/local/sbin/sysmon"],
      ensure  => present,
   }

   cron { 'sysmon':
    command  => '/usr/local/sbin/sysmon',
    user     => 'root',
    minute   => '*/3',
    hour     => '*',
    month    => '*',
    monthday => '*',
    weekday  => '*',
    ensure   => absent,
    require  => File['/usr/local/sbin/sysmon'],  
  }

  cron { 'remove_old_sysmon':
    command  => "/usr/bin/find /var/log/sysmon/ -type d -mtime +30 -exec rm -fr '{}' ';'",
    user     => 'root',
    minute   => '0',
    hour     => '0',
    month    => '*',
    monthday => '*',
    weekday  => '*',
    ensure   => absent,
    require  => File['/usr/local/sbin/sysmon'],  
  }

  cron { 'zip_old_sysmon':
    command  => "/usr/bin/find /var/log/sysmon/ -type f -mtime +1 -name '*.txt' -exec ionice -c 3 bzip2 '{}' ';'",
    user     => 'root',
    minute   => '0',
    hour     => '0',
    month    => '*',
    monthday => '*',
    weekday  => '*',
    ensure   => absent,
    require  => File['/usr/local/sbin/sysmon'],  
  }
}
