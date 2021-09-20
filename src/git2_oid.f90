module git2_oid
    use, intrinsic :: iso_c_binding
    implicit none
    private

    public :: git_oid_tostr_s
    public :: git_oid_tostr
    public :: git_oid_shorten_new
    public :: git_oid_fromstr
    public :: git_oid_fromstrp
    public :: git_oid_fromstrn
    public :: git_oid_fromraw
    public :: git_oid_fmt
    public :: git_oid_nfmt
    public :: git_oid_pathfmt
    public :: git_oid_cpy
    public :: git_oid_cmp
    public :: git_oid_equal
    public :: git_oid_ncmp
    public :: git_oid_streq
    public :: git_oid_strcmp
    public :: git_oid_is_zero
    public :: git_oid_shorten_add
    public :: git_oid_shorten_free

    integer(kind=c_int), parameter, public :: GIT_OID_RAWSZ        = 20
    integer(kind=c_int), parameter, public :: GIT_OID_HEXSZ        = GIT_OID_RAWSZ * 2
    integer(kind=c_int), parameter, public :: GIT_OID_MINPREFIXLEN = 4

    ! git_oid
    type, bind(c), public :: git_oid
        integer(kind=c_signed_char) :: id(GIT_OID_RAWSZ)
    end type git_oid

    ! git_oid_shorten
    type, bind(c), public :: git_oid_shorten
        type(c_ptr)            :: nodes
        integer(kind=c_size_t) :: node_count
        integer(kind=c_size_t) :: size
        integer(kind=c_int)    :: min_length
        integer(kind=c_int)    :: full
    end type git_oid_shorten

    interface
        ! char *git_oid_tostr_s(const git_oid *oid)
        function git_oid_tostr_s(oid) bind(c, name='git_oid_tostr_s')
            import :: c_ptr, git_oid
            type(git_oid), intent(in) :: oid
            type(c_ptr) :: git_oid_tostr_s
        end function git_oid_tostr_s

        ! char *git_oid_tostr(char *out, size_t n, const git_oid *id)
        function git_oid_tostr(out, n, id) bind(c, name='git_oid_tostr')
            import :: c_char, c_ptr, c_size_t, git_oid
            character(kind=c_char), intent(in) :: out
            integer(kind=c_size_t), intent(in), value :: n
            type(git_oid), intent(in) :: id
            type(c_ptr) :: git_oid_tostr
        end function git_oid_tostr

        ! git_oid_shorten *git_oid_shorten_new(size_t min_length)
        function git_oid_shorten_new(min_length) bind(c, name='git_oid_shorten_new')
            import :: c_ptr, c_size_t
            integer(kind=c_size_t), intent(in), value :: min_length
            type(c_ptr) :: git_oid_shorten_new
        end function git_oid_shorten_new

        ! int git_oid_fromstr(git_oid *out, const char *str)
        function git_oid_fromstr(out, str) bind(c, name='git_oid_fromstr')
            import :: c_char, c_int, git_oid
            type(git_oid), intent(in) :: out
            character(kind=c_char), intent(in) :: str
            integer(kind=c_int) :: git_oid_fromstr
        end function git_oid_fromstr

        ! int git_oid_fromstrp(git_oid *out, const char *str)
        function git_oid_fromstrp(out, str) bind(c, name='git_oid_fromstrp')
            import :: c_char, c_int, git_oid
            type(git_oid), intent(in) :: out
            character(kind=c_char), intent(in) :: str
            integer(kind=c_int) :: git_oid_fromstrp
        end function git_oid_fromstrp

        ! int git_oid_fromstrn(git_oid *out, const char *str, size_t length)
        function git_oid_fromstrn(out, str, length) bind(c, name='git_oid_fromstrn')
            import :: c_char, c_int, c_size_t, git_oid
            type(git_oid), intent(in) :: out
            character(kind=c_char), intent(in) :: str
            integer(kind=c_size_t), intent(in), value :: length
            integer(kind=c_int) :: git_oid_fromstrn
        end function git_oid_fromstrn

        ! int git_oid_fromraw(git_oid *out, const unsigned char *raw)
        function git_oid_fromraw(out, raw) bind(c, name='git_oid_fromraw')
            import :: c_int, c_signed_char, git_oid
            type(git_oid), intent(in) :: out
            integer(kind=c_signed_char), intent(in) :: raw
            integer(kind=c_int) :: git_oid_fromraw
        end function git_oid_fromraw

        ! int git_oid_fmt(char *out, const git_oid *id)
        function git_oid_fmt(out, id) bind(c, name='git_oid_fmt')
            import :: c_char, c_int, git_oid
            character(kind=c_char), intent(in) :: out
            type(git_oid), intent(in) :: id
            integer(kind=c_int) :: git_oid_fmt
        end function git_oid_fmt

        ! int git_oid_nfmt(char *out, size_t n, const git_oid *id)
        function git_oid_nfmt(out, n, id) bind(c, name='git_oid_nfmt')
            import :: c_char, c_int, c_size_t, git_oid
            character(kind=c_char), intent(in) :: out
            integer(kind=c_size_t), intent(in), value :: n
            type(git_oid), intent(in) :: id
            integer(kind=c_int) :: git_oid_nfmt
        end function git_oid_nfmt

        ! int git_oid_pathfmt(char *out, const git_oid *id)
        function git_oid_pathfmt(out, id) bind(c, name='git_oid_pathfmt')
            import :: c_char, c_int, git_oid
            character(kind=c_char), intent(in) :: out
            type(git_oid), intent(in) :: id
            integer(kind=c_int) :: git_oid_pathfmt
        end function git_oid_pathfmt

        ! int git_oid_cpy(git_oid *out, const git_oid *src)
        function git_oid_cpy(out, src) bind(c, name='git_oid_cpy')
            import :: c_int, git_oid
            type(git_oid), intent(in) :: out
            type(git_oid), intent(in) :: src
            integer(kind=c_int) :: git_oid_cpy
        end function git_oid_cpy

        ! int git_oid_cmp(const git_oid *a, const git_oid *b)
        function git_oid_cmp(a, b) bind(c, name='git_oid_cmp')
            import :: c_int, git_oid
            type(git_oid), intent(in) :: a
            type(git_oid), intent(in) :: b
            integer(kind=c_int) :: git_oid_cmp
        end function git_oid_cmp

        ! int git_oid_equal(const git_oid *a, const git_oid *b)
        function git_oid_equal(a, b) bind(c, name='git_oid_equal')
            import :: c_int, git_oid
            type(git_oid), intent(in) :: a
            type(git_oid), intent(in) :: b
            integer(kind=c_int) :: git_oid_equal
        end function git_oid_equal

        ! int git_oid_ncmp(const git_oid *a, const git_oid *b, size_t len)
        function git_oid_ncmp(a, b, len) bind(c, name='git_oid_ncmp')
            import :: c_int, c_size_t, git_oid
            type(git_oid), intent(in) :: a
            type(git_oid), intent(in) :: b
            integer(kind=c_size_t), intent(in), value :: len
            integer(kind=c_int) :: git_oid_ncmp
        end function git_oid_ncmp

        ! int git_oid_streq(const git_oid *id, const char *str)
        function git_oid_streq(id, str) bind(c, name='git_oid_streq')
            import :: c_char, c_int, git_oid
            type(git_oid), intent(in) :: id
            character(kind=c_char), intent(in) :: str
            integer(kind=c_int) :: git_oid_streq
        end function git_oid_streq

        ! int git_oid_strcmp(const git_oid *id, const char *str)
        function git_oid_strcmp(id, str) bind(c, name='git_oid_strcmp')
            import :: c_char, c_int, git_oid
            type(git_oid), intent(in) :: id
            character(kind=c_char), intent(in) :: str
            integer(kind=c_int) :: git_oid_strcmp
        end function git_oid_strcmp

        ! int git_oid_is_zero(const git_oid *id)
        function git_oid_is_zero(id) bind(c, name='git_oid_is_zero')
            import :: c_int, git_oid
            type(git_oid), intent(in) :: id
            integer(kind=c_int) :: git_oid_is_zero
        end function git_oid_is_zero

        ! int git_oid_shorten_add(git_oid_shorten *os, const char *text_id)
        function git_oid_shorten_add(os, text_id) bind(c, name='git_oid_shorten_add')
            import :: c_char, c_int, git_oid_shorten
            type(git_oid_shorten), intent(in) :: os
            character(kind=c_char), intent(in) :: text_id
            integer(kind=c_int) :: git_oid_shorten_add
        end function git_oid_shorten_add

        ! void git_oid_shorten_free(git_oid_shorten *os)
        subroutine git_oid_shorten_free(os) bind(c, name='git_oid_shorten_free')
            import :: git_oid_shorten
            type(git_oid_shorten), intent(in) :: os
        end subroutine git_oid_shorten_free
    end interface
end module git2_oid
