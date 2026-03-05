---
title: "Configure my Notebook"
crdate: "2026-03-05"
subject: learn linny
---

## Configure my first level menu

Open the first level menu. If unsure focus on the Linny Menu and click `H`. The click `c` to open the 1st level menu configuration file.

Here you can configure the menu by setting the widgets. These are the widgets you can use:

- `starred_documents` - shows all starred documents
- `starred_terms` - shows all starred terms
- `starred_taxonomies` - shows all starred taxonomies
- `all_taxonomies` - show all taxonomies
- `recently_modified_documents` - shows a list of recently modified documents
- `menu` - customizable menu

Below a sample conifguration with all available widgets:

```yaml
---
widgets:

  - title: Starred Documents
    type: starred_documents
    hidden: false

  - title: Starred Terms
    type: starred_terms
    hidden: false

  - title: Starred Taxanomies
    type: starred_taxonomies

  - title: All Taxanomies
    type: all_taxonomies

  - title: Recently Modified Documents
    type: recently_modified_documents
    hidden: false

  - hidden: false
    title: Extra Menu
    type: menu
    items:
      - title: Open 'Tags'
        execute: call linny_menu#openterm('tags', '')
      - title: Open 'Tags:Note'
        execute: call linny_menu#openterm('tags', 'note')
      - title: Open View 'home'
        execute: call linny_menu#openview('root')
      - title: Open View 'custom'
        execute: call linny_menu#openview('custom')
      - title: Close vim
        execute: qa
      - title: Close this menu
        execute: LinnyMenuClose
```

## Configure my taxonomies

The taxonomies are configured in the root config.

[[VIM :e config/_default/config.yaml]]

## Configure a taxonomy menu

Open the tags taxonomy menu [[LIN tags]] and then click `c`.

See https://linden-project.github.io/docs/linden-specification/version-0.2/#config-files-in-linden-rootwikiconfig for all options to configure.

## Configure a term menu

Open the tags taxonomy menu [[LIN tags:note]] and then click `c`.

See https://linden-project.github.io/docs/linden-specification/version-0.2/#config-files-in-linden-rootwikiconfig for all options to configure.
