#!/bin/bash
exe=$(dmenu_run -fn 'Inconsolata 9' -nb '#000000' -nf '#EEEEEE' -sb '#888A95' -sf '#000000') && eval "exec $exe"
