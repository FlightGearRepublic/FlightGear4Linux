#!/bin/bash

# FlightGear4Linux

# ABOUT
# This software will download the source code of FlightGear and it's main dependencies.
# Then it will compiled them.
# And finally, install them to your home folder.

# AUTHOR
# This software was originally created and written by Megaf <mmegaf (at) gmail.com> <https://github.com/Megaf>
# On 30/10/2021

# TODO: Define initial variables.
# TODO: Add function to detect if FlightGear was already installed with either FGB or FlightGear4Linux
# TODO: Add function to detect Linux distribuiton.
# TODO: Add function to install dependencies.
# TODO: List of required packages.

# set_vars function, it will create and set variables that will be used by the script.
# Among others, compiler flags and install destination will be set here.
set_vars () {
    # Setting compiler flags.
    debug_compier_flags="-Og -mtune=native -march=native" # Optimze for debugging/developing.
    safe_compiler_flags="-O2 -pipe -Wall -std=c++11 -mtune=native -march=native" # Optimize for stability.
    fast_compiler_flags="-Os -pipe -Wall -ffastmath -flto -mtune=native -march=native -mfpmath=both" # Optimize for performance. Potentially unstable.
    plib_flags=""
    osg_flags=""
    simgear_flags=""
    flightgear_flags=""
    # git repositories where the code will be downloaded from.
    plib_svn_url="svn://svn.code.sf.net/p/plib/code/trunk" # PLIB's Subversion Repo.
    osg_git_url="https://github.com/openscenegraph/OpenSceneGraph.git" # OpenSceneGraph Git Repo.
    sg_git_url="git://git.code.sf.net/p/flightgear/simgear" # SimGear Git Repo.
    fg_git_url="git://git.code.sf.net/p/flightgear/flightgear" # FlightGear Git Repo.
    fgdata_dit="git://git.code.sf.net/p/flightgear/fgdata" # FlightGear Data Git Repo.
    # Defaut directories destination.
    source_dir="/tmp/FlightGear4Linux/"
    install_dir="/usr/local/" # Install destination.
}

# detect_distro function, it will detect the distro this script is running on.
detect_distro () {
    # TODO: Find many possibilities of distro names.
    # Things to expect from the commands bellow.
    # Debian, Fedora, NixOS, 
    lsb_distro="$(lsb_release -is)" # Will get distro name from the command lsb_release and set it as the value of "lsb_distro".
#    os_release-"$(cat /etc/os-release | grep ^ID= | awk -F "=" '{print $2}')"
    echo "You are running this script on "$distro""
}

# Functions to install dependencies.
# On Debian, Ubuntu and Mint derivatives.
install_deps_debian () {
}

# On Red Hat, Fedora, CentOS and derivatives.
install_deps_redhat () {
}

# On SUSE and derivatives.
install_deps_suse () {
}

# On Arch, Manjaro and derivatives.
install_deps_arch () {
}

# install_dependencies function, it will run the function detect_distro followed by the
# apropriate install_deps function.
install_dependencies () {
    detect_distro # Detect distro on the computer this script is running from.
}

# draw_gui function, it draws some simple decoration where messages will be displayed.
draw_gui () {
    echo "!##! ""$message"" !##!"
}

# draw_intro function, it will draw an introduction to the software on the users screen.
draw_intro () {
    local message="Welcome to FlightGear4Linux."
    draw_gui
}

# draw_menu function, it will draw on the a menu with the possible options for this software.
draw_menu () {
    local message=""
    draw_gui
}

# set_options function, it will set the options chosen in the menu.
# TODO: Make this set compiler flags accoring to users preference.
# TODO: This function should set install destination, compiling optings (debug vs stability vs performance),
set_options () {
    local message=""
    draw_gui
}

# set_dest function, it will set where FlightGear should be installed to.
set_dest () {
}

# TODO: Add functions to:
# set compiler options accoridng to users choice;
# set FlightGear start options according to the users choice;

# git_glone function, it will use git to clone a repository if not already
# cloned and update it if it is already cloned.
git_clone () {
    git clone "$git_url" "$destination_dir"
}

# svn_checkout function, it will use subversion to clone a respository if not already
# cloned and update it if it is already cloned.
svn_checkout () {
    cd "$source_dir"
    svn checkout "$plib_svn_url"
}

# build_plib function, it will download the source of plib and then compile it.
build_plib () {
}

# build_osg function, it will download the source code of OpenSceneGraph and then compile it.
build_osg () {
}

# build_sg function, it will download the source code of SimGear and then compile it.
build_sg () {
}

# build_fg function, it willd download the source code of FlightGear, then compile it and then
# install it to the desired location.
build_fg () {
}

set_vars # Setting variables.
draw_intro # Shows welcome message.
draw_menu # Shows options menu.
set_options # Set options.
install_dependencies # Install dependencies for detected OS.

# Building OSG.
message="Building OSG."
draw_gui
git_url="$osg_git_url"
destination_dir="$source_dir"/osg
git_clone
build_osg
