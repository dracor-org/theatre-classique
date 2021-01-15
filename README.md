# Théâtre Classique

XML files as obtained from
http://theatre-classique.fr/pages/programmes/PageEdition.php.

## How to update

### Prerequisites

For the update script to work you need to have `lynx` and `wget` installed.

### Fetch new files

To update the repo with newly added files run

```bash
./update
```

This will *not* download files that already exist in the repo.

### Update all files

To update all files including changes to already dowloaded ones run

```bash
./update --all
```

### Update individual files

To update just one individual file with upstream changes delete the file and the
run a simple update again:

```bash
rm xml/MOLIERE_TARTUFFE.xml
./update
```
