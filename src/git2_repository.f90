module git2_repository
    use, intrinsic :: iso_c_binding
    use :: git2_annotated_commit
    use :: git2_buffer
    use :: git2_oid
    implicit none
    private

    ! git_configmap_item
    integer(kind=c_int), parameter, public :: GIT_CONFIGMAP_AUTO_CRLF        = 0
    integer(kind=c_int), parameter, public :: GIT_CONFIGMAP_EOL              = 1
    integer(kind=c_int), parameter, public :: GIT_CONFIGMAP_SYMLINKS         = 2
    integer(kind=c_int), parameter, public :: GIT_CONFIGMAP_IGNORECASE       = 3
    integer(kind=c_int), parameter, public :: GIT_CONFIGMAP_FILEMODE         = 4
    integer(kind=c_int), parameter, public :: GIT_CONFIGMAP_IGNORESTAT       = 5
    integer(kind=c_int), parameter, public :: GIT_CONFIGMAP_TRUSTCTIME       = 6
    integer(kind=c_int), parameter, public :: GIT_CONFIGMAP_ABBREV           = 7
    integer(kind=c_int), parameter, public :: GIT_CONFIGMAP_PRECOMPOSE       = 8
    integer(kind=c_int), parameter, public :: GIT_CONFIGMAP_SAFE_CRLF        = 9
    integer(kind=c_int), parameter, public :: GIT_CONFIGMAP_LOGALLREFUPDATES = 10
    integer(kind=c_int), parameter, public :: GIT_CONFIGMAP_PROTECTHFS       = 11
    integer(kind=c_int), parameter, public :: GIT_CONFIGMAP_PROTECTNTFS      = 12
    integer(kind=c_int), parameter, public :: GIT_CONFIGMAP_FSYNCOBJECTFILES = 13
    integer(kind=c_int), parameter, public :: GIT_CONFIGMAP_CACHE_MAX        = 14

    ! git_repository_init_options
    type, bind(c), public :: git_repository_init_options
        integer(kind=c_int)     :: version
        integer(kind=c_int32_t) :: flags
        integer(kind=c_int32_t) :: mode
        type(c_ptr)             :: workdir_path
        type(c_ptr)             :: description
        type(c_ptr)             :: template_path
        type(c_ptr)             :: initial_head
        type(c_ptr)             :: origin_url
    end type git_repository_init_options

    public :: git_repository_path
    public :: git_repository_workdir
    public :: git_repository_commondir
    public :: git_repository_get_namespace
    public :: git_repository_open
    public :: git_repository_open_from_worktree
    public :: git_repository_wrap_odb
    public :: git_repository_discover
    public :: git_repository_open_ext
    public :: git_repository_open_bare
    public :: git_repository_init
    public :: git_repository_init_options_init
    public :: git_repository_init_ext
    public :: git_repository_head
    public :: git_repository_head_for_worktree
    public :: git_repository_head_detached
    public :: git_repository_head_detached_for_worktree
    public :: git_repository_head_unborn
    public :: git_repository_is_empty
    public :: git_repository_item_path
    public :: git_repository_set_workdir
    public :: git_repository_is_bare
    public :: git_repository_is_worktree
    public :: git_repository_config
    public :: git_repository_config_snapshot
    public :: git_repository_odb
    public :: git_repository_refdb
    public :: git_repository_index
    public :: git_repository_message
    public :: git_repository_message_remove
    public :: git_repository_state_cleanup
    public :: git_repository_fetchhead_foreach
    public :: git_repository_mergehead_foreach
    public :: git_repository_hashfile
    public :: git_repository_set_head
    public :: git_repository_set_head_detached
    public :: git_repository_set_head_detached_from_annotated
    public :: git_repository_detach_head
    public :: git_repository_state
    public :: git_repository_set_namespace
    public :: git_repository_is_shallow
    public :: git_repository_ident
    public :: git_repository_set_ident
    public :: git_repository_free

    interface
        ! const char *git_repository_path(const git_repository *repo)
        function git_repository_path(repo) bind(c, name='git_repository_path')
            import :: c_ptr
            type(c_ptr), intent(in), value :: repo
            type(c_ptr) :: git_repository_path
        end function git_repository_path

        ! const char *git_repository_workdir(const git_repository *repo)
        function git_repository_workdir(repo) bind(c, name='git_repository_workdir')
            import :: c_ptr
            type(c_ptr), intent(in), value :: repo
            type(c_ptr) :: git_repository_workdir
        end function git_repository_workdir

        ! const char *git_repository_commondir(const git_repository *repo)
        function git_repository_commondir(repo) bind(c, name='git_repository_commondir')
            import :: c_ptr
            type(c_ptr), intent(in), value :: repo
            type(c_ptr) :: git_repository_commondir
        end function git_repository_commondir

        ! const char *git_repository_get_namespace(git_repository *repo)
        function git_repository_get_namespace(repo) bind(c, name='git_repository_get_namespace')
            import :: c_ptr
            type(c_ptr), intent(in), value :: repo
            type(c_ptr) :: git_repository_get_namespace
        end function git_repository_get_namespace

        ! int git_repository_open(git_repository **out, const char *path)
        function git_repository_open(out, path) bind(c, name='git_repository_open')
            import :: c_char, c_int, c_ptr
            type(c_ptr), intent(out) :: out
            character(kind=c_char), intent(in) :: path
            integer(kind=c_int) :: git_repository_open
        end function git_repository_open

        ! int git_repository_open_from_worktree(git_repository **out, git_worktree *wt)
        function git_repository_open_from_worktree(out, wt) bind(c, name='git_repository_open_from_worktree')
            import :: c_int, c_ptr
            type(c_ptr), intent(out) :: out
            type(c_ptr), intent(in), value :: wt
            integer(kind=c_int) :: git_repository_open_from_worktree
        end function git_repository_open_from_worktree

        ! int git_repository_wrap_odb(git_repository **out, git_odb *odb)
        function git_repository_wrap_odb(out, odb) bind(c, name='git_repository_wrap_odb')
            import :: c_int, c_ptr
            type(c_ptr), intent(out) :: out
            type(c_ptr), intent(in), value :: odb
            integer(kind=c_int) :: git_repository_wrap_odb
        end function git_repository_wrap_odb

        ! int git_repository_discover(git_buf *out, const char *start_path, bool across_fs, const char *ceiling_dirs)
        function git_repository_discover(out, start_path, across_fs, ceiling_dirs) bind(c, name='git_repository_discover')
            import :: c_bool, c_char, c_int, git_buf
            type(git_buf), intent(out) :: out
            character(kind=c_char), intent(in) :: start_path
            logical(kind=c_bool), intent(in), value :: across_fs
            character(kind=c_char), intent(in) :: ceiling_dirs
            integer(kind=c_int) :: git_repository_discover
        end function git_repository_discover

        ! int git_repository_open_ext(git_repository **out, const char *path, unsigned int flags, const char *ceiling_dirs)
        function git_repository_open_ext(out, path, flags, ceiling_dirs) bind(c, name='git_repository_open_ext')
            import :: c_char, c_int, c_ptr
            type(c_ptr), intent(out) :: out
            character(kind=c_char), intent(in) :: path
            integer(kind=c_int), intent(in), value :: flags
            character(kind=c_char), intent(in) :: ceiling_dirs
            integer(kind=c_int) :: git_repository_open_ext
        end function git_repository_open_ext

        ! int git_repository_open_bare(git_repository **out, const char *bare_path)
        function git_repository_open_bare(out, bare_path) bind(c, name='git_repository_open_bare')
            import :: c_char, c_int, c_ptr
            type(c_ptr), intent(out) :: out
            character(kind=c_char), intent(in) :: bare_path
            integer(kind=c_int) :: git_repository_open_bare
        end function git_repository_open_bare

        ! int git_repository_init(git_repository **out, const char *path, bool is_bare)
        function git_repository_init(out, path, is_bare) bind(c, name='git_repository_init')
            import :: c_bool, c_char, c_int, c_ptr
            type(c_ptr), intent(out) :: out
            character(kind=c_char), intent(in) :: path
            logical(kind=c_bool), intent(in), value :: is_bare
            integer(kind=c_int) :: git_repository_init
        end function git_repository_init

        ! int git_repository_init_options_init(git_repository_init_options *opts, unsigned int version)
        function git_repository_init_options_init(opts, version) bind(c, name='git_repository_init_options_init')
            import :: c_int, git_repository_init_options
            type(git_repository_init_options), intent(in) :: opts
            integer(kind=c_int), intent(in), value :: version
            integer(kind=c_int) :: git_repository_init_options_init
        end function git_repository_init_options_init

        ! int git_repository_init_ext(git_repository **out, const char *repo_path, git_repository_init_options *opts)
        function git_repository_init_ext(out, repo_path, opts) bind(c, name='git_repository_init_ext')
            import :: c_char, c_int, c_ptr, git_repository_init_options
            type(c_ptr), intent(out) :: out
            character(kind=c_char), intent(in) :: repo_path
            type(git_repository_init_options), intent(in) :: opts
            integer(kind=c_int) :: git_repository_init_ext
        end function git_repository_init_ext

        ! int git_repository_head(git_reference **out, git_repository *repo)
        function git_repository_head(out, repo) bind(c, name='git_repository_head')
            import :: c_int, c_ptr
            type(c_ptr), intent(out) :: out
            type(c_ptr), intent(in), value :: repo
            integer(kind=c_int) :: git_repository_head
        end function git_repository_head

        ! int git_repository_head_for_worktree(git_reference **out, git_repository *repo, const char *name)
        function git_repository_head_for_worktree(out, repo, name) bind(c, name='git_repository_head_for_worktree')
            import :: c_char, c_int, c_ptr
            type(c_ptr), intent(out) :: out
            type(c_ptr), intent(in), value :: repo
            character(kind=c_char), intent(in) :: name
            integer(kind=c_int) :: git_repository_head_for_worktree
        end function git_repository_head_for_worktree

        ! int git_repository_head_detached(git_repository *repo)
        function git_repository_head_detached(repo) bind(c, name='git_repository_head_detached')
            import :: c_int, c_ptr
            type(c_ptr), intent(in), value :: repo
            integer(kind=c_int) :: git_repository_head_detached
        end function git_repository_head_detached

        ! int git_repository_head_detached_for_worktree(git_repository *repo, const char *name)
        function git_repository_head_detached_for_worktree(repo, name) bind(c, name='git_repository_head_detached_for_worktree')
            import :: c_char, c_int, c_ptr
            type(c_ptr), intent(in), value :: repo
            character(kind=c_char), intent(in) :: name
            integer(kind=c_int) :: git_repository_head_detached_for_worktree
        end function git_repository_head_detached_for_worktree

        ! int git_repository_head_unborn(git_repository *repo)
        function git_repository_head_unborn(repo) bind(c, name='git_repository_head_unborn')
            import :: c_int, c_ptr
            type(c_ptr), intent(in), value :: repo
            integer(kind=c_int) :: git_repository_head_unborn
        end function git_repository_head_unborn

        ! int git_repository_is_empty(git_repository *repo)
        function git_repository_is_empty(repo) bind(c, name='git_repository_is_empty')
            import :: c_int, c_ptr
            type(c_ptr), intent(in), value :: repo
            integer(kind=c_int) :: git_repository_is_empty
        end function git_repository_is_empty

        ! int git_repository_item_path(git_buf *out, const git_repository *repo, git_repository_item_t item)
        function git_repository_item_path(out, repo, item) bind(c, name='git_repository_item_path')
            import :: c_int, c_ptr, git_buf
            type(git_buf), intent(out) :: out
            type(c_ptr), intent(in), value :: repo
            integer(kind=c_int), intent(in), value :: item
            integer(kind=c_int) :: git_repository_item_path
        end function git_repository_item_path

        ! int git_repository_set_workdir(git_repository *repo, const char *workdir, int update_gitlink)
        function git_repository_set_workdir(repo, workdir, update_gitlink) bind(c, name='git_repository_set_workdir')
            import :: c_char, c_int, c_ptr
            type(c_ptr), intent(in), value :: repo
            character(kind=c_char), intent(in) :: workdir
            integer(kind=c_int), intent(in), value :: update_gitlink
            integer(kind=c_int) :: git_repository_set_workdir
        end function git_repository_set_workdir

        ! int git_repository_is_bare(const git_repository *repo)
        function git_repository_is_bare(repo) bind(c, name='git_repository_is_bare')
            import :: c_int, c_ptr
            type(c_ptr), intent(in), value :: repo
            integer(kind=c_int) :: git_repository_is_bare
        end function git_repository_is_bare

        ! int git_repository_is_worktree(const git_repository *repo)
        function git_repository_is_worktree(repo) bind(c, name='git_repository_is_worktree')
            import :: c_int, c_ptr
            type(c_ptr), intent(in), value :: repo
            integer(kind=c_int) :: git_repository_is_worktree
        end function git_repository_is_worktree

        ! int git_repository_config(git_config **out, git_repository *repo)
        function git_repository_config(out, repo) bind(c, name='git_repository_config')
            import :: c_int, c_ptr
            type(c_ptr), intent(out) :: out
            type(c_ptr), intent(in), value :: repo
            integer(kind=c_int) :: git_repository_config
        end function git_repository_config

        ! int git_repository_config_snapshot(git_config **out, git_repository *repo)
        function git_repository_config_snapshot(out, repo) bind(c, name='git_repository_config_snapshot')
            import :: c_int, c_ptr
            type(c_ptr), intent(out) :: out
            type(c_ptr), intent(in), value :: repo
            integer(kind=c_int) :: git_repository_config_snapshot
        end function git_repository_config_snapshot

        ! int git_repository_odb(git_odb **out, git_repository *repo)
        function git_repository_odb(out, repo) bind(c, name='git_repository_odb')
            import :: c_int, c_ptr
            type(c_ptr), intent(out) :: out
            type(c_ptr), intent(in), value :: repo
            integer(kind=c_int) :: git_repository_odb
        end function git_repository_odb

        ! int git_repository_refdb(git_refdb **out, git_repository *repo)
        function git_repository_refdb(out, repo) bind(c, name='git_repository_refdb')
            import :: c_int, c_ptr
            type(c_ptr), intent(out) :: out
            type(c_ptr), intent(in), value :: repo
            integer(kind=c_int) :: git_repository_refdb
        end function git_repository_refdb

        ! int git_repository_index(git_index **out, git_repository *repo)
        function git_repository_index(out, repo) bind(c, name='git_repository_index')
            import :: c_int, c_ptr
            type(c_ptr), intent(out) :: out
            type(c_ptr), intent(in), value :: repo
            integer(kind=c_int) :: git_repository_index
        end function git_repository_index

        ! int git_repository_message(git_buf *out, git_repository *repo)
        function git_repository_message(out, repo) bind(c, name='git_repository_message')
            import :: c_int, c_ptr, git_buf
            type(git_buf), intent(out) :: out
            type(c_ptr), intent(in), value :: repo
            integer(kind=c_int) :: git_repository_message
        end function git_repository_message

        ! int git_repository_message_remove(git_repository *repo)
        function git_repository_message_remove(repo) bind(c, name='git_repository_message_remove')
            import :: c_int, c_ptr
            type(c_ptr), intent(in), value :: repo
            integer(kind=c_int) :: git_repository_message_remove
        end function git_repository_message_remove

        ! int git_repository_state_cleanup(git_repository *repo)
        function git_repository_state_cleanup(repo) bind(c, name='git_repository_state_cleanup')
            import :: c_int, c_ptr
            type(c_ptr), intent(in), value :: repo
            integer(kind=c_int) :: git_repository_state_cleanup
        end function git_repository_state_cleanup

        ! int git_repository_fetchhead_foreach(git_repository *repo, git_repository_fetchhead_foreach_cb callback, void *payload)
        function git_repository_fetchhead_foreach(repo, callback, payload) bind(c, name='git_repository_fetchhead_foreach')
            import :: c_funptr, c_int, c_ptr
            type(c_ptr), intent(in), value :: repo
            type(c_funptr), intent(in), value :: callback
            type(c_ptr), intent(in), value :: payload
            integer(kind=c_int) :: git_repository_fetchhead_foreach
        end function git_repository_fetchhead_foreach

        ! int git_repository_mergehead_foreach(git_repository *repo, git_repository_mergehead_foreach_cb callback, void *payload)
        function git_repository_mergehead_foreach(repo, callback, payload) bind(c, name='git_repository_mergehead_foreach')
            import :: c_funptr, c_int, c_ptr
            type(c_ptr), intent(in), value :: repo
            type(c_funptr), intent(in), value :: callback
            type(c_ptr), intent(in), value :: payload
            integer(kind=c_int) :: git_repository_mergehead_foreach
        end function git_repository_mergehead_foreach

        ! int git_repository_hashfile(git_oid *out, git_repository *repo, const char *path, git_object_t type, const char *as_path)
        function git_repository_hashfile(out, repo, path, type, as_path) bind(c, name='git_repository_hashfile')
            import :: c_char, c_int, c_ptr, git_oid
            type(git_oid), intent(out) :: out
            type(c_ptr), intent(in), value :: repo
            character(kind=c_char), intent(in) :: path
            integer(kind=c_int), intent(in), value :: type
            character(kind=c_char), intent(in) :: as_path
            integer(kind=c_int) :: git_repository_hashfile
        end function git_repository_hashfile

        ! int git_repository_set_head(git_repository *repo, const char *refname)
        function git_repository_set_head(repo, refname) bind(c, name='git_repository_set_head')
            import :: c_char, c_int, c_ptr
            type(c_ptr), intent(in), value :: repo
            character(kind=c_char), intent(in) :: refname
            integer(kind=c_int) :: git_repository_set_head
        end function git_repository_set_head

        ! int git_repository_set_head_detached(git_repository *repo, const git_oid *commitish)
        function git_repository_set_head_detached(repo, commitish) bind(c, name='git_repository_set_head_detached')
            import :: c_int, c_ptr, git_oid
            type(c_ptr), intent(in), value :: repo
            type(git_oid), intent(in) :: commitish
            integer(kind=c_int) :: git_repository_set_head_detached
        end function git_repository_set_head_detached

        ! int git_repository_set_head_detached_from_annotated(git_repository *repo, const git_annotated_commit *commitish)
        function git_repository_set_head_detached_from_annotated(repo, commitish) &
                bind(c, name='git_repository_set_head_detached_from_annotated')
            import :: c_int, c_ptr
            type(c_ptr), intent(in), value :: repo
            type(c_ptr), intent(in), value :: commitish
            integer(kind=c_int) :: git_repository_set_head_detached_from_annotated
        end function git_repository_set_head_detached_from_annotated

        ! int git_repository_detach_head(git_repository *repo)
        function git_repository_detach_head(repo) bind(c, name='git_repository_detach_head')
            import :: c_int, c_ptr
            type(c_ptr), intent(in), value :: repo
            integer(kind=c_int) :: git_repository_detach_head
        end function git_repository_detach_head

        ! int git_repository_state(git_repository *repo)
        function git_repository_state(repo) bind(c, name='git_repository_state')
            import :: c_int, c_ptr
            type(c_ptr), intent(in), value :: repo
            integer(kind=c_int) :: git_repository_state
        end function git_repository_state

        ! int git_repository_set_namespace(git_repository *repo, const char *nmspace)
        function git_repository_set_namespace(repo, nmspace) bind(c, name='git_repository_set_namespace')
            import :: c_char, c_int, c_ptr
            type(c_ptr), intent(in), value :: repo
            character(kind=c_char), intent(in) :: nmspace
            integer(kind=c_int) :: git_repository_set_namespace
        end function git_repository_set_namespace

        ! int git_repository_is_shallow(git_repository *repo)
        function git_repository_is_shallow(repo) bind(c, name='git_repository_is_shallow')
            import :: c_int, c_ptr
            type(c_ptr), intent(in), value :: repo
            integer(kind=c_int) :: git_repository_is_shallow
        end function git_repository_is_shallow

        ! int git_repository_ident(const char **name, const char **email, const git_repository *repo)
        function git_repository_ident(name, email, repo) bind(c, name='git_repository_ident')
            import :: c_int, c_ptr
            type(c_ptr), intent(in) :: name
            type(c_ptr), intent(in) :: email
            type(c_ptr), intent(in), value :: repo
            integer(kind=c_int) :: git_repository_ident
        end function git_repository_ident

        ! int git_repository_set_ident(git_repository *repo, const char *name, const char *email)
        function git_repository_set_ident(repo, name, email) bind(c, name='git_repository_set_ident')
            import :: c_char, c_int, c_ptr
            type(c_ptr), intent(in), value :: repo
            character(kind=c_char), intent(in) :: name
            character(kind=c_char), intent(in) :: email
            integer(kind=c_int) :: git_repository_set_ident
        end function git_repository_set_ident

        ! void git_repository_free(git_repository *repo)
        subroutine git_repository_free(repo) bind(c, name='git_repository_free')
            import :: c_ptr
            type(c_ptr), intent(in), value :: repo
        end subroutine git_repository_free
    end interface
end module git2_repository
