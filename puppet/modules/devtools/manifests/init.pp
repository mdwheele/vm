class devtools {
    include devtools::failboat
    include devtools::php

    package { 'git' :
        ensure => latest,
    }
}