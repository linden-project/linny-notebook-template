# Linny Notes Boilerplate (Hugo Template)

This is the Linny Notes Boilerplate. If you want to try out the Linny Plugin in
Vim or Neovim make a copy on your disk of this boilerplate first. Call it
anything you want. I saved it as $HOME/secondbrain.

The boilerplate is using Hugo to serve as indexer. It creates json-files which
the Linny plugin uses to create side menus for navigating through your Notes.

We used to call this setup Call, but this is a bit confusing. Sorry for this.

# Quickstart

[Read the Linny.vim + Carl quick start tutorial](https://linden-project.github.io/posts/tutorial-linny-and-carl/)

## Install

To be able to run Hugo as indexer you need to have installed a recent version
of [Hugo](https://gohugo.io/). At time of writing this was 0.123.0.

To install Carl clone this repository to a place on your harddrive.

```
git clone https://github.com/linden-project/linny-notes-boilerplate ~/MyLinnyNotes
```

## Start Hugo as daemon

To start Hugo as a Linny Indexer execute the following commands.

```
cd ~/MyLindenNotes
hugo server \
  --ignoreCache \
  --forceSyncStatic \
  --cleanDestinationDir \
  --disableFastRender
```

Or just ./RUNME.sh start

## NOTE

In rare cases taxonomies or terms or other index files are not modified
automatically. Restart the hugo process to fix this problem.

In the Linny Side Menu press <kbd>SHIFT+R</kbd> to refresh.

## Contributors

- [Pim Snel](https://github.com/mipmip) - creator and maintainer
