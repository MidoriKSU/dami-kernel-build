#!/bin/bash

echo "Injecting EXPORT_SYMBOL for Droidspaces..."

if [ ! -d "ipc" ]; then
    exit 1
fi

if [ -f "ipc/msgutil.c" ] && ! grep -qF 'EXPORT_SYMBOL(init_ipc_ns);' "ipc/msgutil.c"; then
    sed -i '/^struct msg_msgseg {/i EXPORT_SYMBOL(init_ipc_ns);' "ipc/msgutil.c"
    echo "Patched ipc/msgutil.c successfully."
fi

if [ -f "ipc/namespace.c" ] && ! grep -qF 'EXPORT_SYMBOL(put_ipc_ns);' "ipc/namespace.c"; then
    sed -i '/^static struct ns_common \*ipcns_get(/i EXPORT_SYMBOL(put_ipc_ns);' "ipc/namespace.c"
    echo "Patched ipc/namespace.c successfully."
fi
