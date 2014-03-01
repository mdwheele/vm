class devtools {
    require yum

    include devtools::rpmbuild
    include devtools::php
    include devtools::vm

}