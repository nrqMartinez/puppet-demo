package { 'httpd':
ensure => installed,
}

service {'httpd':

ensure => running,
require => Package['httpd'],
}

file {'/etc/httpd/conf/httpd.conf':
ensure => present,
source => ${module-name}/files/httpd.conf,
}

file {'/var/www/error/missing.html':
ensure => present,
source => ${module-name}/files/missing.html,

}
