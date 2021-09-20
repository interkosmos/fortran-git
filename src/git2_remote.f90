module git2_remote
    use, intrinsic :: iso_c_binding
    use :: git2_proxy
    implicit none
    private

    ! git_fetch_prune_t
    enum, bind(c)
        enumerator :: GIT_FETCH_PRUNE_UNSPECIFIED
        enumerator :: GIT_FETCH_PRUNE
        enumerator :: GIT_FETCH_NO_PRUNE
    end enum

    ! git_remote_autotag_option_t
    enum, bind(c)
        enumerator :: GIT_REMOTE_DOWNLOAD_TAGS_UNSPECIFIED = 0
        enumerator :: GIT_REMOTE_DOWNLOAD_TAGS_AUTO
        enumerator :: GIT_REMOTE_DOWNLOAD_TAGS_NONE
        enumerator :: GIT_REMOTE_DOWNLOAD_TAGS_ALL
    end enum

    integer(kind=c_int), parameter, public :: GIT_FETCH_OPTIONS_VERSION    = 1
    integer(kind=c_int), parameter, public :: GIT_REMOTE_CALLBACKS_VERSION = 1
    integer(kind=c_int), parameter, public :: GIT_REMOTE_CALLBACKS_INIT(1) = [ GIT_REMOTE_CALLBACKS_VERSION ]

    integer(kind=c_int), parameter, public :: GIT_FETCH_OPTIONS_INIT(6) = [ GIT_FETCH_OPTIONS_VERSION, &
                                                                            GIT_REMOTE_CALLBACKS_INIT, &
                                                                            GIT_FETCH_PRUNE_UNSPECIFIED, &
                                                                            1, &
                                                                            GIT_REMOTE_DOWNLOAD_TAGS_UNSPECIFIED, &
                                                                            GIT_PROXY_OPTIONS_INIT ]
end module git2_remote
