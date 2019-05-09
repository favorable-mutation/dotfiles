# Usage

To setup a new machine:

*   If you want to use the desktop-switching features of
    [chunkwm](https://koekeishiya.github.io/chunkwm/) with macOS
    Mojave, you'll need to boot the machine into Recovery Mode and disable SIP.
    To do so, restart the computer while holding down `Cmd + R`, navigate to
    `Utilities > Terminal`, and run the following command.  

    ```
    csrutil disable
    ```

    This is a security liability, particularly on machines with a single
    administrator/root account, so if this is a work machine, you may not be able
    to do this. Sending windows to new desktops will still work, but following
    the windows will not. My workaround is to create a shortcut for switching
    desktops from the keyboard under `System Preferences > Keyboard > Shortcuts >
    Mission Control > Mission Control > Move left a space`.
    
*   Install [Homebrew](https://brew.sh/).

*   Clone this repo to a `~/etc` folder; setup commands assume this path, and
    assume that your home directory is at `/Users/<username>/`. You will need to
    modify paths in the init scripts if you have different needs.

    ```
    git clone https://github.com/favorable-mutation/dotfiles.git ~/etc
    ```

*   Make the `~/etc/init/` scripts executable:

    ```
    chmod u+x ~/etc/init/*.sh
    ```

*   Make any changes you want to the scripts with your favorite editor. I would
    recommend carefully looking through each script to see what it does, and
    adjusting any settings that you will not need. The first script sets a ton
    of user preferences for macOS. The second installs several programs from
    Homebrew. The output for the second script is written to `~/brew.log` and
    `~/brew.err`. The third links my configuration files into place. Run the
    scripts in the following order:

    ```
    ./setup-macos.sh
    ./setup-brew.sh &
    ./setup-env.sh
    ```
