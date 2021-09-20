module git2_annotated_commit
    use, intrinsic :: iso_c_binding
    use :: git2_oid
    implicit none
    private

    public :: git_annotated_commit_from_ref
    public :: git_annotated_commit_from_fetchhead
    public :: git_annotated_commit_from_lookup
    public :: git_annotated_commit_from_revspec
    public :: git_annotated_commit_id_
    public :: git_annotated_commit_ref_
    public :: git_annotated_commit_free

    interface
        ! int git_annotated_commit_from_ref(git_annotated_commit **out, git_repository *repo, const git_reference *ref)
        function git_annotated_commit_from_ref(out, repo, ref) bind(c, name='git_annotated_commit_from_ref')
            import :: c_int, c_ptr
            type(c_ptr), intent(in)        :: out
            type(c_ptr), intent(in), value :: repo
            type(c_ptr), intent(in), value :: ref
            integer(kind=c_int)            :: git_annotated_commit_from_ref
        end function git_annotated_commit_from_ref

        ! int git_annotated_commit_from_fetchhead(git_annotated_commit **out, git_repository *repo, const char *branch_name, const char *remote_url, const git_oid *id)
        function git_annotated_commit_from_fetchhead(out, repo, branch_name, remote_url, id) &
                bind(c, name='git_annotated_commit_from_fetchhead')
            import :: c_char, c_int, c_ptr
            type(c_ptr),            intent(in)        :: out
            type(c_ptr),            intent(in), value :: repo
            character(kind=c_char), intent(in)        :: branch_name
            character(kind=c_char), intent(in)        :: remote_url
            type(c_ptr),            intent(in), value :: id
            integer(kind=c_int)                       :: git_annotated_commit_from_fetchhead
        end function git_annotated_commit_from_fetchhead

        ! int git_annotated_commit_lookup(git_annotated_commit **out, git_repository *repo, const git_oid *id)
        function git_annotated_commit_from_lookup(out, repo, id) bind(c, name='git_annotated_commit_from_lookup')
            import :: c_int, c_ptr
            type(c_ptr), intent(in)        :: out
            type(c_ptr), intent(in), value :: repo
            type(c_ptr), intent(in), value :: id
            integer(kind=c_int)            :: git_annotated_commit_from_lookup
        end function git_annotated_commit_from_lookup

        ! int git_annotated_commit_from_revspec(git_annotated_commit **out, git_repository *repo, const char *revspec)
        function git_annotated_commit_from_revspec(out, repo, revspec) bind(c, name='git_annotated_commit_from_revspec')
            import :: c_int, c_ptr
            type(c_ptr), intent(in)        :: out
            type(c_ptr), intent(in), value :: repo
            type(c_ptr), intent(in), value :: revspec
            integer(kind=c_int)            :: git_annotated_commit_from_revspec
        end function git_annotated_commit_from_revspec

        ! const git_oid *git_annotated_commit_id(const git_annotated_commit *commit)
        function git_annotated_commit_id_(commit) bind(c, name='git_annotated_commit_id')
            import :: c_ptr
            type(c_ptr), intent(in), value :: commit
            type(c_ptr)                    :: git_annotated_commit_id_
        end function git_annotated_commit_id_

        ! const char *git_annotated_commit_ref(const git_annotated_commit *commit)
        function git_annotated_commit_ref_(commit) bind(c, name='git_annotated_commit_ref')
            import :: c_ptr
            type(c_ptr), intent(in), value :: commit
            type(c_ptr)                    :: git_annotated_commit_ref_
        end function git_annotated_commit_ref_

        ! void git_annotated_commit_free(git_annotated_commit *commit)
        subroutine git_annotated_commit_free(commit) bind(c, name='git_annotated_commit_free')
            import :: c_ptr
            type(c_ptr), intent(in), value :: commit
        end subroutine git_annotated_commit_free
    end interface
end module git2_annotated_commit
