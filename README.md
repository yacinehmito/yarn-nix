# yarn

"**Y**acine's **a**wesome **r**epository of **N**ix expressions"
is where I store the configuration of my NixOS devices.
As I have several of them, and some custom packages and modules, I came up
with this very small framework so the maintenance stays as painless
as possible.

As such, yarn is both a repository of packages, modules, and configurations
that may interest you, *and* a (humble) framework that you can reuse for
your own machines.

If you don't know NixOS, make yourself a favor: use it. The pain of system
management will go away<sub>*</sub>. It starts with the [website](https://nixos.org).

\*I am not a doctor though, so I make no promises.

## Workflow

To use yarn as I do, you must have the latest version of NixOS installed.
It is also preferable to subscribe to the unstable channel as none other
has been tested.

The steps to follow:

1. Fork the repo so you can push into it later.
2. Clone your fork wherever you want and branch out the `master` branch.
3. Create a folder in `devices` for your custom device modules and add its
name in `devices/all-devices.nix`.
4. Copy the `configuration.nix` file to `/etc/nixos` and replace `device-name`
by the name of your custom device.
5. Type `nixos-rebuild switch` in your terminal and you're set.

You repeat the relevant steps for each of your devices.

Add custom modules and packages in their respective folders and top-level
nix files. They will be shared among all of your devices once you push
your changes.

The `master` branch is the one I currently use for my devices ; take it
as a working example. 

Many devices share common use cases, so I advise you to create "abstract"
devices. They are not meant to be added to `devices/all-devices.nix`, but to
factor out what's common across multiple devices.
For example, I want to install the same software on all of
my personnal computers. Therefore, I created a `pc` device and manually
imported it in the modules of the actual devices.

## Rationale

I have three good reasons to adopt this workflow.

1. NixOS allows seamless rollbacks if something breaks,
but it doesn't save the corresponding Nix expressions.
Version control solves this. I can type `git reset` whenever I mess up or
change my mind.
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
the new expressions eventually get merged).
It's not very hard as you just have to branch and rebase if a conflict arises.
Things get more complicated though if you want to maintain expressions
that you don't intend to push upstream. You then need to maintain a new branch,
that must be kept in sync as well.
Now say I want to cherry-pick a derivation from master but want to keep the
rest on unstable, while also using a custom derivation. You get the picture :
branch management gets old quite fast.
Yarn is therefore useful just by virtue of *not* being nixpkgs.

Also, nixpkgs is a behemoth:
`<nixpkgs/pkgs/top-level/all-packages.nix>` is thousands of lines long 
and the tree, although fairly well organized,
goes quite deep. This hampers navigation in the command line and it is
sometimes hard to keep a mental map of the relevant parts.

I use my own nixpkgs tree when I need to quickly hack into existing
expressions or if I need to push anything upstream. For everything else, yarn
does the job better.

## What does yarn do?

If you mean the framework, by itself not much.
It simply returns a set where the keys are the names of the device folders
and the values are modules that will:
- import the module located in said folder
- import the modules in the list returned by `modules/module-list.nix`
- set `nixpkgs.config.packageOverrides` so that the new packages set is the
one returned by `packages/all-packages.nix` (it means that you should not
use packageOverrides yourself)
- set `nix.nixPath` so the file `/etc/nixos/configuration.nix` is used
as the top-level module (this is the default behaviour of NixOS)

You can read `default.nix` to better understand what happens under the cover.
You will see that `yarn` is quite small ; it shows how powerful Nix is as
a language.

## My configuration

In this repository, you will not only find the framework but also my actual
configuration. This may include unreleased packages and modules, so use at
your own risks.

I am currently in the process of migrating my dotfiles so they are
exclusively managed by yarn. The main benefit will be the ability to truly
sync my two computers, to the point where I will have exactly the same
environment on both.

## Licencing

I sometimes unshamedly copy-paste whole parts of Nix expressions from
`nixpkgs`, which is under the MIT licence. I am legally obligated to mention
this. As a convenience, I license my work under the same MIT license. See the
notice.
