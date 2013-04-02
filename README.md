# My workflow

These are the settings I use for my daily things. I put them up here because I juggle between a lot of computers and VPSes, and this provides me an easy way to get myself setup quickly.

## What does it do?

* It overwrites your ``.inputrc`` so that you have a smarter history search, as in it searches history entries that start with what you have before your cursor.
* It overwrites your ``.vimrc`` to apply some settings like swapping between soft and hard tabs (defaulting to hard of course), enabling completion of {x,x?ht}ml tags, some color schemes, additional languages, hotkeys, etc.
* It adds git@github as g in your ``.ssh/config``

## Setup

Installing these settings is fairly straightforward, just run this in your shell:

``
./install
``

WARNING: this will overwrite your ``.vimrc``, ``.inputrc`` and possibly some other stuff as well.

## Disclaimer

The vim plugins included here, not mine, don't blame me if they break your stuff. If my stuff breaks your stuff, don't blame me anyway, I'm stating here that these you shouldn't apply these things unless you know what they do and really want them, so the joke's on you.

## Permissions
For the stuff I wrote, it's licensed IDKIDC license, so do whatever you want, for other people's stuff, ask them. If you have ideas that would fit my workflow, by all means, share the love.
