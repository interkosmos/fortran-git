module git2
    use, intrinsic :: iso_c_binding
    use :: git2_annotated_commit
    use :: git2_buffer
    use :: git2_errors
    use :: git2_global
    use :: git2_oid
    use :: git2_repository
    use :: git2_strarray
    use :: git2_types
    implicit none

    interface
        function c_strlen(str) bind(c, name='strlen')
            import :: c_ptr, c_size_t
            type(c_ptr), intent(in), value :: str
            integer(c_size_t)              :: c_strlen
        end function c_strlen
    end interface

    public :: c_f_str_ptr
    public :: git_error_last
contains
    function git_error_last()
        !! Wrapper function that calls `git_error_last_()` and converts the
        !! returned C pointer to Fortran pointer.
        type(git_error), pointer :: git_error_last
        type(c_ptr)              :: ptr

        ptr = git_error_last_()
        if (.not. c_associated(ptr)) return
        call c_f_pointer(ptr, git_error_last)
    end function git_error_last

    subroutine c_f_str_ptr(c_str, f_str)
        !! Copies a C character array, passed as a C pointer, to a Fortran
        !! allocatable string.
        type(c_ptr),                   intent(in)  :: c_str
        character(len=:), allocatable, intent(out) :: f_str
        character(kind=c_char, len=1), pointer     :: ptrs(:)
        integer                                    :: i

        if (.not. c_associated(c_str)) then
            f_str = ' '
            return
        end if

        allocate (character(len=c_strlen(c_str)) :: f_str)
        call c_f_pointer(c_str, ptrs, [ huge(0) ])

        i = 1

        do while (ptrs(i) /= c_null_char .and. i <= len(f_str))
            f_str(i:i) = ptrs(i)
            i = i + 1
        end do

        if (i < len(f_str)) f_str(i:) = ' '
    end subroutine c_f_str_ptr
end module git2
