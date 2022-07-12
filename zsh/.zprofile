
# Setting PATH for Python 3.10
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"
export PATH

# Setting PATH for Python 2.7
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

##
# Your previous /Users/ryan/.zprofile file was backed up as /Users/ryan/.zprofile.macports-saved_2022-06-24_at_15:13:29
##

# MacPorts Installer addition on 2022-06-24_at_15:13:29: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# i think homebrew requires this?
export PATH="/usr/local/sbin:$PATH"

# doom emacs -- bin/doom utility
export PATH="$HOME/.emacs.d/bin:$PATH"
