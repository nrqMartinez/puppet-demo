class apache {
	package { 'httpd':
		ensure => installed,
	}

	service {'httpd':

		ensure => running,
		require => Package['httpd'],
	}	

	file {'/etc/httpd/conf/httpd.conf':
		ensure => present,
		#source => "puppet:///modules/${module_name}/files/httpd.conf",
		source => "/vagrant/curso_puppet/puppet-demo/session2/modules/${module_name}/files/httpd.conf",
		subscribe => Service['httpd'],
	}	

	file {'/var/www/error':
		ensure => directory,
		mode => 755,
	}

	file {'/var/www/html':
		ensure => directory,
		mode => 755,
	}

	file {'/var/www/html/index.html':
		ensure => present,
	#	source => "puppet:///modules/${module_name}/files/index.html",
		source => "/vagrant/curso_puppet/puppet-demo/session2/modules/${module_name}/files/index.html",
	}

	file {'/var/www/error/missing.html':
		ensure => present,
		source => "/vagrant/curso_puppet/puppet-demo/session2/modules/${module_name}/files/missing.html",
	#	source => "puppet:///modules/${module_name}/files/missing.html",

	}	
}
