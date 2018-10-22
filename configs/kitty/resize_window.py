"""resize kinda like tmux did"""


def main():
    pass


def handle_result(args, _, target_window_id, boss):
    # process args
    direction = args[1]
    size = 3

    # get neighbors
    tab = boss.active_tab
    nbs = tab.current_layout.neighbors(tab.windows, tab.active_window_idx)
    keys = ['left', 'right', 'top', 'bottom']
    nl, nr, nt, nb = [bool(len(nbs[k])) for k in keys]
    nx = (nl, nr)
    ny = (nt, nb)

    # allow resize when there is a neighbor in target direction
    # expand right and down, shrink left and up
    if direction == 'left':
        size *= 1 if nl and not all(nx) else -1
        size *= 1 if any(nx) else 0
    elif direction == 'right':
        size *= 1 if nr else -1
        size *= 1 if any(nx) else 0
    elif direction == 'up':
        size *= 1 if nt and not all(ny) else -1
        size *= 1 if any(ny) else 0
    elif direction == 'down':
        size *= 1 if nb else -1
        size *= 1 if any(ny) else 0
    else:
        size = 0

    # resize
    window = boss.window_id_map.get(target_window_id)
    boss.resize_layout_window(window, size, direction in keys[:2])


handle_result.no_ui = True
