class sysmon::sysstat {
   package {'sysstat':
      ensure => installed,
   }

   if $::osfamily == 'Debian' {
      file {'/etc/default/sysstat':
         source => 'puppet:///modules/sysmon/debian_sysstat',
         mode   => '0644',
         owner  => 'root',
         group  => 'root',
         ensure => present,
      }
      file {'/etc/cron.d/sysstat':
         source => 'puppet:///modules/sysmon/sysstat_ubuntu.cron',
         mode   => '0644',
         owner  => 'root',
         group  => 'root',
         ensure => present,
      }
   }

   if $facts['os']['name'] == 'Amazon' {
      file {'/etc/cron.d/sysstat':
         source => 'puppet:///modules/sysmon/sysstat_amazon.cron',
         mode   => '0644',
         owner  => 'root',
         group  => 'root',
         ensure => present,
      }
   }
   exec {'sysstat_firstrun':
      command     => '/sbin/service sysstat start',
      refreshonly => true,
   }
   service {'sysstat':
      enable => true,
   }
}
