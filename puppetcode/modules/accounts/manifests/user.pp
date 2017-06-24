class accounts::user {
   group { [ 'devops', 'dev', deploy ]:
      ensure => present,
   }
   $accounts = hiera_hash('accounts')
   create_resources(user, $accounts)

   ## add ssh pub keys per user
   $ssh_pub_keys = hiera_hash('ssh_pub_keys')
   create_resources(ssh_authorized_key, $ssh_pub_keys)
}