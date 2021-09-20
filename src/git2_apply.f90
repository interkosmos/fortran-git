module git2_apply
    use, intrinsic :: iso_c_binding
    implicit none
    private

    ! git_apply_flags_t
    integer, parameter, public :: GIT_APPLY_CHECK = shiftl(1, 0)

    ! git_apply_location_t
    integer, parameter, public :: GIT_APPLY_LOCATION_WORKDIR = 0
    integer, parameter, public :: GIT_APPLY_LOCATION_INDEX   = 1
    integer, parameter, public :: GIT_APPLY_LOCATION_BOTH    = 2

    type, bind(c), public :: git_apply_options
        integer(kind=c_int) :: version
        type(c_funptr)      :: delta_cb
        type(c_funptr)      :: hunk_cb
        type(c_ptr)         :: payload
        integer(kind=c_int) :: flags
    end type git_apply_options

    public :: git_apply
    public :: git_apply_options_init
    public :: git_apply_to_tree

    interface
        ! int git_apply(git_repository *repo, git_diff *diff, git_apply_location_t location, const git_apply_options *options)
        function git_apply(repo, diff, location, options) bind(c, name='git_apply')
            import :: c_int, c_ptr, git_apply_options
            type(c_ptr),             intent(in), value :: repo
            type(c_ptr),             intent(in), value :: diff
            integer(kind=c_int),     intent(in), value :: location
            type(git_apply_options), intent(in)        :: options
            integer(kind=c_int)                        :: git_apply
        end function git_apply

        ! int git_apply_options_init(git_apply_options *opts, unsigned int version)
        function git_apply_options_init(opts, version) bind(c, name='git_apply_options_init')
            import :: c_int, c_ptr
            type(c_ptr),         intent(in), value :: opts
            integer(kind=c_int), intent(in), value :: version
            integer(kind=c_int)                    :: git_apply_options_init
        end function git_apply_options_init

        ! int git_apply_to_tree(git_index **out, git_repository *repo, git_tree *preimage, git_diff *diff, const git_apply_options *options)
        function git_apply_to_tree(out, repo, preimage, diff, options) bind(c, name='git_apply_to_tree')
            import :: c_int, c_ptr, git_apply_options
            type(c_ptr),             intent(in)        :: out
            type(c_ptr),             intent(in), value :: repo
            type(c_ptr),             intent(in), value :: preimage
            type(c_ptr),             intent(in), value :: diff
            type(git_apply_options), intent(in)        :: options
            integer(kind=c_int)                        :: git_apply_to_tree
        end function git_apply_to_tree
    end interface
end module git2_apply
