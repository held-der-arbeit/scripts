#!/usr/bin/env python3

import logging
import os

# sometimes clamav will log this warning:
# LibClamAV Warning: Detected duplicate databases /var/lib/clamav/bytecode.cvd and /var/lib/clamav/bytecode.cld, please manually remove one of them
# the choosen one is /var/lib/clamav/bytecode.cld in this script

logging.basicConfig(filename="<REPLACE_WITH_FILE_TO_LOG_TO>", level=logging.INFO)

clamdir = '/var/lib/clamav/'
clamdbdup = 'bytecode.cld'

try:
  if os.path.isfile(clamdir + clamdbdup):
    os.remove(clamdir + clamdbdup)
    logging.info("Deleted " + clamdbdup)
  else:
    logging.info("File " + clamdbdup + " did not exist.")
except OSError as e:
  logging.error("There occured an error removing " + clamdbdup)
