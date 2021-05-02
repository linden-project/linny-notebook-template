# Carl

Carl is a Linden Indexer implemented in Hugo.

## Install

To be able to run Carl you need to have installed a recent version of
[Hugo](https://gohugo.io/). At time of writing this was 0.8.1.

To install Carl clone this repository to a place on your harddrive.

```
git clone https://github.com/linden-project/carl ~/MyLindenWiki
```

## Start Carl as daemon

Run to start Carl as a Linden Indexer execute the following commands.

```
cd ~/MyLindenWiki
hugo server \
  --renderToDisk \
  --ignoreCache \
  --forceSyncStatic \
  --cleanDestinationDir \
  --disableFastRender
```

## Contributors

- [Pim Snel](https://github.com/mipmip) - creator and maintainer
