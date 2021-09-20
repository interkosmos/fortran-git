module git2_proxy
    use, intrinsic :: iso_c_binding
    implicit none
    private

    integer(kind=c_int), parameter, public :: GIT_PROXY_OPTIONS_VERSION = 1
    integer(kind=c_int), parameter, public :: GIT_PROXY_OPTIONS_INIT(1) = [ GIT_PROXY_OPTIONS_VERSION ]
end module git2_proxy
