module git2_errors
    use, intrinsic :: iso_c_binding
    implicit none
    private

    public :: git_error_last_
    public :: git_error_set_str
    public :: git_error_clear
    public :: git_error_set_oom

    type, bind(c), public :: git_error
        type(c_ptr)         :: message
        integer(kind=c_int) :: klass
    end type git_error

    interface
        ! const git_error *git_error_last(void)
        function git_error_last_() bind(c, name='git_error_last')
            import :: c_ptr
            type(c_ptr) :: git_error_last_
        end function git_error_last_

        ! int git_error_set_str(int error_class, const char *string)
        function git_error_set_str(error_class, string) bind(c, name='git_error_set_str')
            import :: c_char, c_int
            integer(kind=c_int), intent(in), value :: error_class
            character(kind=c_char), intent(in) :: string
            integer(kind=c_int) :: git_error_set_str
        end function git_error_set_str

        ! void git_error_clear(void)
        subroutine git_error_clear() bind(c, name='git_error_clear')
        end subroutine git_error_clear

        ! void git_error_set_oom(void)
        subroutine git_error_set_oom() bind(c, name='git_error_set_oom')
        end subroutine git_error_set_oom
    end interface
end module git2_errors
