#!/usr/bin/python
import subprocess
import json
import sys

cli = 'movetoworkspace' if "--move" in sys.argv else 'workspace'


def get_current_workspace():
    monitor_list = (
        subprocess.run("hyprctl -j monitors".split(), stdout=subprocess.PIPE, check=False)
        .stdout.decode("utf-8")
        .strip()
    )

    monitor_list = json.loads(monitor_list)
    for monitor in monitor_list:
        if monitor["focused"] == True:
            return [monitor["name"], monitor["activeWorkspace"]["id"]]
    return []


current_workspace = int(get_current_workspace()[1])
current_monitor = str(get_current_workspace()[0])


workspaces = json.loads(subprocess.run(
    "hyprctl -j workspaces".split(), stdout=subprocess.PIPE, check=False)
    .stdout.decode("utf-8")
    .strip()
)

current_monitor_workspaces = []
all_workspaces = []
for ws in workspaces:
    all_workspaces.append(int(ws['id']))
    if ws['monitor'] == current_monitor:
        current_monitor_workspaces.append(int(ws['id']))
current_monitor_workspaces.sort(reverse=False)
all_workspaces.sort(reverse=False)

cmw_with_empty = []
for i in range(1, all_workspaces[-1]+1):
    if i in current_monitor_workspaces or (i not in current_monitor_workspaces and i not in all_workspaces):
        cmw_with_empty.append(i)


if "--right" in sys.argv:
    if current_workspace == cmw_with_empty[-1]:
        subprocess.run(
            f"hyprctl dispatch {cli} {all_workspaces[-1]+1}".split())
    else:
        count = 0
        for cmw in cmw_with_empty:
            if cmw == current_workspace:
                subprocess.run(
                    f"hyprctl dispatch {cli} {cmw_with_empty[count+1]}".split())
                break
            count += 1

elif "--left" in sys.argv:
    if current_workspace != cmw_with_empty[0]:
        count = 0
        for cmw in cmw_with_empty:
            if cmw == current_workspace:
                subprocess.run(
                    f"hyprctl dispatch {cli} {cmw_with_empty[count-1]}".split())
                break
            count += 1

