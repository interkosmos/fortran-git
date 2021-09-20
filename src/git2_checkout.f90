module git2_checkout
    use, intrinsic :: iso_c_binding
    use :: git2_strarray
    use :: git2_types
    implicit none
    private

    ! git_checkout_strategy_t
    integer(kind=c_int), parameter, public :: GIT_CHECKOUT_NONE                         = 0
    integer(kind=c_int), parameter, public :: GIT_CHECKOUT_SAFE                         = shiftl(1, 0)
    integer(kind=c_int), parameter, public :: GIT_CHECKOUT_FORCE                        = shiftl(1, 1)
    integer(kind=c_int), parameter, public :: GIT_CHECKOUT_RECREATE_MISSING             = shiftl(1, 2)
    integer(kind=c_int), parameter, public :: GIT_CHECKOUT_ALLOW_CONFLICTS              = shiftl(1, 4)
    integer(kind=c_int), parameter, public :: GIT_CHECKOUT_REMOVE_UNTRACKED             = shiftl(1, 5)
    integer(kind=c_int), parameter, public :: GIT_CHECKOUT_REMOVE_IGNORED               = shiftl(1, 6)
    integer(kind=c_int), parameter, public :: GIT_CHECKOUT_UPDATE_ONLY                  = shiftl(1, 7)
    integer(kind=c_int), parameter, public :: GIT_CHECKOUT_DONT_UPDATE_INDEX            = shiftl(1, 8)
    integer(kind=c_int), parameter, public :: GIT_CHECKOUT_NO_REFRESH                   = shiftl(1, 9)
    integer(kind=c_int), parameter, public :: GIT_CHECKOUT_SKIP_UNMERGED                = shiftl(1, 10)
    integer(kind=c_int), parameter, public :: GIT_CHECKOUT_USE_OURS                     = shiftl(1, 11)
    integer(kind=c_int), parameter, public :: GIT_CHECKOUT_USE_THEIRS                   = shiftl(1, 12)
    integer(kind=c_int), parameter, public :: GIT_CHECKOUT_DISABLE_PATHSPEC_MATCH       = shiftl(1, 13)
    integer(kind=c_int), parameter, public :: GIT_CHECKOUT_SKIP_LOCKED_DIRECTORIES      = shiftl(1, 18)
    integer(kind=c_int), parameter, public :: GIT_CHECKOUT_DONT_OVERWRITE_IGNORED       = shiftl(1, 19)
    integer(kind=c_int), parameter, public :: GIT_CHECKOUT_CONFLICT_STYLE_MERGE         = shiftl(1, 20)
    integer(kind=c_int), parameter, public :: GIT_CHECKOUT_CONFLICT_STYLE_DIFF3         = shiftl(1, 21)
    integer(kind=c_int), parameter, public :: GIT_CHECKOUT_DONT_REMOVE_EXISTING         = shiftl(1, 22)
    integer(kind=c_int), parameter, public :: GIT_CHECKOUT_DONT_WRITE_INDEX             = shiftl(1, 23)
    integer(kind=c_int), parameter, public :: GIT_CHECKOUT_UPDATE_SUBMODULES            = shiftl(1, 16)
    integer(kind=c_int), parameter, public :: GIT_CHECKOUT_UPDATE_SUBMODULES_IF_CHANGED = shiftl(1, 17)

    integer(kind=c_int), parameter, public :: GIT_CHECKOUT_OPTIONS_VERSION = 1
    integer(kind=c_int), parameter, public :: GIT_CHECKOUT_OPTIONS_INIT(2) = [ GIT_CHECKOUT_OPTIONS_VERSION, &
                                                                               GIT_CHECKOUT_SAFE ]

    type, bind(c) :: git_checkout_options
        integer(kind=c_unsigned_int) :: version
        integer(kind=c_unsigned_int) :: checkout_strategy
        integer(kind=c_int)          :: disable_filters
        integer(kind=c_unsigned_int) :: dir_mode
        integer(kind=c_unsigned_int) :: file_mode
        integer(kind=c_int)          :: file_open_flags
        integer(kind=c_unsigned_int) :: notify_flags
        type(c_funptr)               :: notify_cb
        type(c_ptr)                  :: notify_payload
        type(c_funptr)               :: progress_cb
        type(c_ptr)                  :: progress_payload
        type(git_strarray)           :: paths
        type(c_ptr)                  :: baseline
        type(c_ptr)                  :: baseline_index
        type(c_ptr)                  :: target_directory
        type(c_ptr)                  :: ancestor_label
        type(c_ptr)                  :: our_label
        type(c_ptr)                  :: their_label
        type(c_funptr)               :: perfdata_cb
        type(c_ptr)                  :: perfdata_payload
    end type git_checkout_options
end module git2_checkout
