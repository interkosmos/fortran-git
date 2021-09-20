module git2_buffer
    use, intrinsic :: iso_c_binding
    implicit none
    private

    ! git_buf
    type, bind(c), public :: git_buf
        type(c_ptr)            :: ptr
        integer(kind=c_size_t) :: asize
        integer(kind=c_size_t) :: size
    end type git_buf
end module git2_buffer
