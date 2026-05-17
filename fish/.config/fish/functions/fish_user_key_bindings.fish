function fish_user_key_bindings
    fish_vi_key_bindings

    bind --mode default ctrl-f tmux_sessionizer repaint
    bind --mode insert ctrl-f tmux_sessionizer repaint
    bind --mode default ctrl-o tmux_jump repaint
    bind --mode insert ctrl-o tmux_jump repaint

    bind --mode insert ctrl-e edit_command_buffer
    bind --mode default ctrl-e edit_command_buffer

    set --global fish_cursor_default block
    set --global fish_cursor_insert block
    set --global fish_cursor_replace_one block
    set --global fish_cursor_replace block
    set --global fish_cursor_external block
    set --global fish_cursor_visual block
end
