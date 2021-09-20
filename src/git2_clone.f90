module git2_clone
    use, intrinsic :: iso_c_binding
    use :: git2_checkout
    use :: git2_remote
    implicit none
    private

    integer(kind=c_int), parameter, public :: GIT_CLONE_OPTIONS_VERSION = 1
    integer(kind=c_int), parameter, public :: GIT_CLONE_OPTIONS_INIT(9) = [ GIT_CLONE_OPTIONS_VERSION, &
                                                                            GIT_CHECKOUT_OPTIONS_VERSION, &
                                                                            GIT_CHECKOUT_SAFE, &
                                                                            GIT_FETCH_OPTIONS_INIT ]


end module git2_clone
