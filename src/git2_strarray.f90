module git2_strarray
    use, intrinsic :: iso_c_binding
    implicit none
    private

    ! git_strarray
    type, bind(c), public :: git_strarray
        type(c_ptr)            :: strings
        integer(kind=c_size_t) :: count
    end type git_strarray
end module git2_strarray
