class devtools {

    include devtools::php

    package { 'git' :
        ensure => latest,
    }

}