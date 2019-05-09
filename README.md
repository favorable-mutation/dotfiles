# Usage

To setup a new machine:

0. If you want to use the desktop-switching features of `chunkwm` with macOS
   Mojave, you'll need to boot the machine into Recovery Mode and disable SIP.
   To do so, restart the computer while holding down `Cmd + R`, navigate to
   `Utilities > Terminal`, and run the following command.  

   `csrutil disable`

   This is a security liability, particularly on machines with a single
   administrator/root account, so if this is a work machine, you may not be able
   to do this. Sending windows to new desktops will still work, but following
   the windows will not. My workaround is to create a shortcut for switching
   desktops from the keyboard under `System Preferences > Keyboard > Shortcuts >
   Mission Control > Mission Control > Move left a space`.

1. Clone the repo to a `~/etc` folder; setup commands assume this path, and
   assume that your home directory is at `/Users/<username>/`. You will need to
   modify paths in the init scripts if you have different needs.

   `git clone ...`

2. Make the `~/etc/init/` scripts executable.

   `chmod u+x ~/etc/init/*.sh`

3. Run the scripts in the following order:

   ```
   ./setup-macos.sh
   ./setup-brew.sh
   ./setup-env.sh
   ```
