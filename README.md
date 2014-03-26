metagit
=======

keep a git repository's metadata as data in the repository

Wait, what? Let me explain: normally, git keeps its metadata in the
.git directory of the repository, mostly as objects accessed via their
SHA-1 checksum. It's not version-controlled there, of course: if you
use "git rebase" to rewrite commits, they are irretrievably
lost. Since commits are accessed by their checksum, there is no way to
add or remove parents from a commit, and modifying a commit message
keeps no backup of it.

Metagit proposes to change all that: it lets you edit metadata using
any shell prompt or text editor, and it also keeps this editable
version of git metadata under git version control. For example, a
commit message is kept in a version-controlled file, so you can edit
it just like a regular file, then commit the file when you're happy
with it. A commit's parents are represented as symlinks in a
directory, and you can delete or add symlinks to change git's notion
of what the commit's parents are.

Metagit is (one day to become) a thin (but slow) wrapper around git
that keeps a versioned .metagit directory containing a diff-friendly
representation of git's metadata. For every git commit modifying data
outside of .metagit/, metagit adds another meta-commit modifying only
data in .metagit.

The idea is that metagit runs before and after each git command, first
reading .metagit and writing .git, then running git, then reading .git
and writing .metagit, then (optionally) committing .metagit to the git
repository (to avoid infinite recursion, this last commit is not
reflected in .metagit).
