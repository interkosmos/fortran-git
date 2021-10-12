! Opens a local Git repository inside the current directory (if repository
! exsits).
program main
    use, intrinsic :: iso_c_binding
    use :: git2
    implicit none
    character(len=*), parameter :: GIT_DIR = '../../'

    integer     :: rc
    type(c_ptr) :: repo

    print '(a)', 'Init ...'
    rc = git_libgit2_init()
    if (rc < 0) call print_last_error()

    print '(3a)', 'Opening repository "', GIT_DIR, '" ...'
    rc = git_repository_open(repo, GIT_DIR // c_null_char)
    if (rc < 0) call print_last_error()

    print '(a)', 'Shutdown ...'
    rc = git_libgit2_shutdown()
    if (rc < 0) call print_last_error()
contains
    subroutine print_last_error()
        character(len=:), allocatable :: message
        type(git_error), pointer      :: error

        error => git_error_last()
        call c_f_str_ptr(error%message, message)
        write (*, '("Error: ", a)') message
    end subroutine print_last_error
end program main
