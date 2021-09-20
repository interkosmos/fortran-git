module git2_types
    use, intrinsic :: iso_c_binding
    implicit none
    private

    integer, parameter, public :: c_unsigned_int    = c_int

    integer, parameter, public :: git_off_t         = c_int64_t
    integer, parameter, public :: git_time_t        = c_int64_t
    integer, parameter, public :: git_object_size_t = c_int64_t

    ! git_object_t
    integer(kind=c_int), parameter, public :: GIT_OBJECT_ANY       = -2
    integer(kind=c_int), parameter, public :: GIT_OBJECT_INVALID   = -1
    integer(kind=c_int), parameter, public :: GIT_OBJECT_COMMIT    =  1
    integer(kind=c_int), parameter, public :: GIT_OBJECT_TREE      =  2
    integer(kind=c_int), parameter, public :: GIT_OBJECT_BLOB      =  3
    integer(kind=c_int), parameter, public :: GIT_OBJECT_TAG       =  4
    integer(kind=c_int), parameter, public :: GIT_OBJECT_OFS_DELTA =  6
    integer(kind=c_int), parameter, public :: GIT_OBJECT_REF_DELTA =  7

    ! git_time
    type, bind(c), public :: git_time
        integer(kind=git_time_t) :: time
        integer(kind=c_int)      :: offset
        character(kind=c_char)   :: sign
    end type git_time

    ! git_signature
    type, bind(c), public :: git_signature
        type(c_ptr)              :: name
        type(c_ptr)              :: email
        integer(kind=git_time_t) :: when
    end type git_signature

    ! git_reference_t
    integer(kind=c_int), parameter, public :: GIT_REFERENCE_INVALID  = 0
    integer(kind=c_int), parameter, public :: GIT_REFERENCE_DIRECT   = 1
    integer(kind=c_int), parameter, public :: GIT_REFERENCE_SYMBOLIC = 2
    integer(kind=c_int), parameter, public :: GIT_REFERENCE_ALL      = ior(GIT_REFERENCE_DIRECT, &
                                                                           GIT_REFERENCE_SYMBOLIC)

    ! git_branch_t
    integer(kind=c_int), parameter, public :: GIT_BRANCH_LOCAL  = 1
    integer(kind=c_int), parameter, public :: GIT_BRANCH_REMOTE = 2
    integer(kind=c_int), parameter, public :: GIT_BRANCH_ALL    = ior(GIT_BRANCH_LOCAL, &
                                                                      GIT_BRANCH_REMOTE)

    ! git_filemode_t
    integer(kind=c_int), parameter, public :: GIT_FILEMODE_UNREADABLE      = int(o'0000000')
    integer(kind=c_int), parameter, public :: GIT_FILEMODE_TREE            = int(o'0040000')
    integer(kind=c_int), parameter, public :: GIT_FILEMODE_BLOB            = int(o'0100644')
    integer(kind=c_int), parameter, public :: GIT_FILEMODE_BLOB_EXECUTABLE = int(o'0100755')
    integer(kind=c_int), parameter, public :: GIT_FILEMODE_LINK            = int(o'0120000')
    integer(kind=c_int), parameter, public :: GIT_FILEMODE_COMMIT          = int(o'0160000')

    ! git_submodule_update_t
    integer(kind=c_int), parameter, public :: GIT_SUBMODULE_UPDATE_CHECKOUT = 1
    integer(kind=c_int), parameter, public :: GIT_SUBMODULE_UPDATE_REBASE   = 2
    integer(kind=c_int), parameter, public :: GIT_SUBMODULE_UPDATE_MERGE    = 3
    integer(kind=c_int), parameter, public :: GIT_SUBMODULE_UPDATE_NONE     = 4

    ! git_submodule_ignore_t
    integer(kind=c_int), parameter, public :: GIT_SUBMODULE_IGNORE_UNSPECIFIED = -1
    integer(kind=c_int), parameter, public :: GIT_SUBMODULE_IGNORE_NONE        =  1
    integer(kind=c_int), parameter, public :: GIT_SUBMODULE_IGNORE_UNTRACKED   =  2
    integer(kind=c_int), parameter, public :: GIT_SUBMODULE_IGNORE_DIRTY       =  3
    integer(kind=c_int), parameter, public :: GIT_SUBMODULE_IGNORE_ALL         =  4

    ! git_submodule_recurse_t
    integer(kind=c_int), parameter, public :: GIT_SUBMODULE_RECURSE_NO       = 0
    integer(kind=c_int), parameter, public :: GIT_SUBMODULE_RECURSE_YES      = 1
    integer(kind=c_int), parameter, public :: GIT_SUBMODULE_RECURSE_ONDEMAND = 2

    ! git_writestream
    type, bind(c), public :: git_writestream
        type(c_funptr) :: write_callback
        type(c_funptr) :: close_callback
        type(c_funptr) :: free_callback
    end type git_writestream
end module git2_types
