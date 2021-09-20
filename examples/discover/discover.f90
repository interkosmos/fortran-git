! Creates a new local Git repository.
program main
    use, intrinsic :: iso_c_binding
    use :: git2
    implicit none
    character(len=*), parameter :: START_FILE = '../../README.md'

    character(len=1024), target :: path
    type(git_buf)               :: path_buf
    type(c_ptr)                 :: repo
    integer                     :: rc

    print '(a)', 'Init ...'
    rc = git_libgit2_init()

    print '(a)', 'Searching for repository ...'
    path_buf = git_buf(c_loc(path), len(path), 0)
    rc = git_repository_discover(path_buf, &
                                 START_FILE // c_null_char, &
                                 .true._c_bool, &
                                 '../../' // c_null_char)

    if (rc == 0) then
        print '(a)', 'Opening repository ...'
        rc = git_repository_open(repo, path // c_null_char)
        if (rc < 0) call print_last_error()
    else
        call print_last_error()
    end if

    print '(a)', 'Shutdown ...'
    rc = git_libgit2_shutdown()
contains
    subroutine print_last_error()
        character(len=:), allocatable :: message
        type(git_error), pointer      :: error

        error => git_error_last()
        allocate (character(len=c_strlen(error%message)) :: message)
        call c_f_str_ptr(error%message, message)
        write (*, '("Error: ", a)') message
    end subroutine print_last_error
end program main
