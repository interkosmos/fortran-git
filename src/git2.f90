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
    public :: c_strlen
    public :: git_error_last

    private :: copy
contains
    pure function copy(a)
        character, intent(in)  :: a(:)
        character(len=size(a)) :: copy
        integer(kind=8)        :: i

        do i = 1, size(a)
            copy(i:i) = a(i)
        end do
    end function copy

    subroutine c_f_str_ptr(c_str, f_str)
        type(c_ptr),                   intent(in)  :: c_str
        character(len=:), allocatable, intent(out) :: f_str
        character(kind=c_char), pointer            :: ptrs(:)
        integer(kind=8)                            :: sz

        if (.not. c_associated(c_str)) return
        sz = c_strlen(c_str)
        if (sz <= 0) return
        call c_f_pointer(c_str, ptrs, [ sz ])
        allocate (character(len=sz) :: f_str)
        f_str = copy(ptrs)
    end subroutine c_f_str_ptr

    function git_error_last()
        !! Wrapper function that calls `git_error_last_()` and converts the
        !! returned C pointer to Fortran pointer.
        type(git_error), pointer :: git_error_last
        type(c_ptr)              :: ptr

        ptr = git_error_last_()
        if (.not. c_associated(ptr)) return
        call c_f_pointer(ptr, git_error_last)
    end function git_error_last
end module git2
