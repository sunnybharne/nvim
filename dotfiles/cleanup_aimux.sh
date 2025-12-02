#!/bin/bash
# Script to remove all aimux keybindings from tmux and restore defaults

echo "Cleaning up aimux tmux keybindings..."

# Restore default window selection keys
tmux bind-key -T prefix 1 select-window -t :=1
tmux bind-key -T prefix 2 select-window -t :=2
tmux bind-key -T prefix 3 select-window -t :=3
tmux bind-key -T prefix 4 select-window -t :=4
tmux bind-key -T prefix 5 select-window -t :=5

# Unbind the aimux toggle key (Ctrl-g)
tmux unbind-key -T prefix C-g

echo "✓ Restored default window selection keys (1-5)"
echo "✓ Removed aimux toggle key (Ctrl-g)"

# Verify the changes
echo ""
echo "Current window selection bindings:"
tmux list-keys | grep "prefix.*[1-5].*select-window"

echo ""
echo "Checking for any remaining aimux references:"
if tmux list-keys | grep -i aimux; then
    echo "⚠️  Some aimux bindings still exist"
else
    echo "✓ No aimux bindings found - cleanup complete!"
fi

echo ""
echo "You can now use prefix + 1-5 to switch between windows normally."
