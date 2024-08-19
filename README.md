# Théâtre Classique

XML files as obtained from
http://theatre-classique.fr/pages/programmes/PageEdition.php.

## How to update

### Prerequisites

For the update script to work you need to have `git`, `lynx` and `wget`
installed.

### Full update

To perform an update of all TEI files in the repo and download the ones that may
have been added since the last update simply run

```bash
./update
```

This will completely wipe out the `xml` directory and download all TEI files
currently available on theatre-classique.fr. This is the safest method to ensure
that all upstream changes including newly added and renamed files are properly
reproduced.

The changes will automatically be committed to a branch in your local git
repository. After reviewing the changes you may want to merge this branch into
into the `main` branch and eventually push them to GitHub.

### Fetch new files

To download only newly added files and add them to the repo run

```bash
./update --new
```

Note: This will _not_ download files that already exist in the repo. Nor will it
clean up files that may have been deleted or renamed upstream. You should
carefully check the newly added files to make sure not to keep older versions of
them under another file name.

### Update individual files

To update just one or more individual files with upstream changes pass the file
names to the update script:

```bash
./update MOLIERE_TARTUFFE.xml
# or
./update MOLIERE_*.xml
```

Note: when updating individual files, the changes are made to the branch that
is currently checked and they are not committed automatically. Be careful not to
overwrite any uncommitted changes.

## The `dracor` branch

The [`dracor`](https://github.com/dracor-org/theatre-classique/tree/dracor)
branch contains
[changes](https://github.com/dracor-org/theatre-classique/compare/dracor) made
before importing the Théâtre Classique sources into FreDraCor that have not yet
been adopted upstream.

After an update the `dracor` branch should be rebased onto the `main` branch:

```bash
git fetch
git checkout dracor
git pull
git rebase -r origin/main
```
