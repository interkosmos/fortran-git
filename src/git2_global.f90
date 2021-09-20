module git2_global
    use, intrinsic :: iso_c_binding
    implicit none
    private

    public :: git_libgit2_init
    public :: git_libgit2_shutdown

    interface
        ! int git_libgit2_init(void)
        function git_libgit2_init() bind(c, name='git_libgit2_init')
            import :: c_int
            integer(kind=c_int) :: git_libgit2_init
        end function git_libgit2_init

        ! int git_libgit2_shutdown(void)
        function git_libgit2_shutdown() bind(c, name='git_libgit2_shutdown')
            import :: c_int
            integer(kind=c_int) :: git_libgit2_shutdown
        end function git_libgit2_shutdown
    end interface
end module git2_global
