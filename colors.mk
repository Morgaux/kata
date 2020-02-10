#
# Color declarations for colourful output (if supported)
#

RESET = $$([ -x "$$(command -v tput)" ] && tput sgr0)
BLACK        = $$([ -x "$$(command -v tput)" ] && tput setaf 0)
RED          = $$([ -x "$$(command -v tput)" ] && tput setaf 1)
GREEN        = $$([ -x "$$(command -v tput)" ] && tput setaf 2)
YELLOW       = $$([ -x "$$(command -v tput)" ] && tput setaf 3)
BLUE         = $$([ -x "$$(command -v tput)" ] && tput setaf 4)
MAGENTA      = $$([ -x "$$(command -v tput)" ] && tput setaf 5)
CYAN         = $$([ -x "$$(command -v tput)" ] && tput setaf 6)
WHITE        = $$([ -x "$$(command -v tput)" ] && tput setaf 7)
BOLD         = $$([ -x "$$(command -v tput)" ] && tput bold)

