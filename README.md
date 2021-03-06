# Contestrus

Contestrus is a platform for hosting algorithmic competitions. It is planned to
feature:

* Different task styles. ACM ICPC (Accepted/Not accepted), IOI (Partial scores),
  Open/Hidden Input.
* Customized contest forms. Contestrus comes with built-in importers for a
  simple contest format, but it's easy to write importers from an existing
  format.
* Simple, fast interface. A useful interface that helps the participants as much
  as possible.
* API. An API that lets users submit their programs via an API and view their
  status.
* Sandboxing. Sandboxing is provided by running each submission within its own
  Docker container.
* Administration interface. An interface to monitor and edit contests.
* Contest and training. Support both running contests but also an open
  environment to train on tasks of previous contests.

Many contest environments are complicated to set up. Contestrus is aiming to be
extremely simple to set up and will be run inside Docker containers for maximum
deployment and development ease.

## Development

Development should be done in a Vagrant box so all development environments
closely reflect production environments and other developers' environments.

Run `vagrant up` to create an Ubuntu 13.04 box for local development. This will
run a provision script also used for production to install:

* Basic packages (openssl, libxml2, lxc, ..)
* Compile and install Ruby 2.0.0
* Install Docker and relevant system patches
* Docker containers for languages supported by Contestrus
* Sets up Contestrus's development database
* Installs Contestrus's gems

Once that's all done, you can go to the repository and run the tests:

```bash
## On host box

# This will take a good while the first time to download and install everything.
# Network is the main bottleneck here. script/provision-development is run when
# the box is booted to provision it.
$ vagrant up
# ssh into the now provisioned Vagrant box.
$ vagrant ssh

## Inside Vagrant-managed box
$ cd /vagrant # Shared directory with host for Contestrus
$ bin/rake # Run all tests
```

You can then run `bin/rails server` to boot the Rails server from within Vagrant. 
This listens on port 3000 inside the Vagrant box. This is forwarded to port 3001
on your own machine.

## Deployment

Coming soon.
