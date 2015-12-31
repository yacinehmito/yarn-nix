# yarn

"**Y**acine's **a**wesome **r**epository of **N**ix expressions"
is where I store the configuration of my NixOS devices.
As I have several of them, and some custom packages and modules, I came up
with this small framework so the maintenance stays as painless as possible.

As such, yarn is both a repository of packages, modules, and configurations
that may interest you, *and* a framework that you can reuse for your own
machines.

If you don't know NixOS, make yourself a favor: use it. The pain of system
management will go away. It starts with the [website](https://nixos.org).

## Workflow

To use yarn as I do, you must have NixOS 15.09 installed.
It is also preferable to subscribe to the unstable channel as none other
has been tested.

The steps to follow:

1. Fork the repo so you can push into it later.
2. Clone your fork wherever you want and branch out the `skeleton` branch.
3. Write a custom device module in the `devices` folder and add its path
to `devices/all-devices.nix`.
4. Import in your top-level configuration module the following
module `(import /path/to/yarn/repo lib).devices.device-name`.
5. Type `nixos-rebuild switch` in your terminal and you're set.

Repeat the steps 2 to 5 for each new device. The top-level configuration module
mentionned in step 4 should be in `/etc/nixos/configuration.nix` if you kept
the default `nix-config`. There is an example file in the root of the repo.

Add custom modules and packages in their respective folders and top-level
nix files. They will be shared among all of your devices once you push
your changes.

The `master` branch is the one I currently use for my devices ; take it
as a working example. I often fiddle with its history, therefore you
should rather create your branch from the protected `skeleton` branch if you
want to follow my changes.

Many devices share common use cases, so I advise you to create _profiles_.
For example, you may want to install the same software on all of
your personnal computers. Just create a module (namely the profile) and
manually import it in each of your device modules.
I put one called `pc` in the `devices` folder.

## Rationale

I have three good reasons to adopt this workflow.

1. NixOS allows seamless rollbacks if something breaks,
but it doesn't save the corresponding Nix expressions.
With yarn, I type `git reset` whenever I mess up.
2. If I need to setup a new device with my favourite applications and a
tailored environment, it is done in a matter of minutes (if not seconds when
cutting waiting time).
3. Configuration in all my devices stay consistent. This is like cloning
your dotfiles but at a much larger scale ; litteraly the whole system.

### Why not fork nixpkgs?

I do fork nixpkgs. However I prefer this setup for packaging standalone
software and writing custom NixOS modules because editing the whole tree
is cumbersome.

When editing nixpkgs, you need to make sure you stay in sync with the channels
(in order to get the binaries) *and* the remote master tree (because it's where
the new expressions eventually get merged). It's not very hard as you just
have to branch and rebase, but it gets quickly tiring.

Also, nixpkgs is a behemoth: opening
`<nixpkgs/pkgs/top-level/all-packages.nix>` takes ages and the tree,
although fairly well organized, goes quite deep. This hampers navigation in
the command line.

To use your custom tree you need to overwrite the default one in `NIX_PATH`.
You still have access to the channel's binaries if you're in sync but you lose
`nix-env -qaP` and `command-not-found`. I like those.

I use my own nixpkgs tree when I need to quickly hack into existing
expressions or if I need to push anything upstream. For everything else, yarn
does the job better.

## What does yarn do?

If you mean the framework, by itself not much. It only:

- merges `pkgs` and the set returned by `packages/all-packages.nix` through
`nixpkgs.config.packageOverrides`; this means you should not use this attribute
somewhere else
- imports the modules in the list returned by `modules/module-list.nix`
- fetches the set returned by `devices/all-devices.nix` containing paths
to device modules and for each of them create new modules by importing the
device module, the custom top-level nix expression for custom packages and
the list of custom modules

You can read `default.nix` to better understand what happens under the cover.
You will see that `yarn` is quite small ; it shows how powerful Nix is.

## My configuration

In this repository, you will not only find the framework but also, as of the
current commit:

- Packaging for sway, a tiling window manager for Wayland, and its library wlc
- The configurations of my desktop and my laptop

## Licencing

I sometimes unshamedly copy-paste whole parts of Nix expressions from
`nixpkgs`, which is under the MIT licence. I am legally obligated to mention
this. As a convenience, I license my work under the same MIT license. See the
notice.
