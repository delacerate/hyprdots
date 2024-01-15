#!/usr/bin/python
import subprocess
import json
import sys


def current_focus_workspace():
    monitor_list = (
        subprocess.run("hyprctl -j monitors".split(), stdout=subprocess.PIPE)
        .stdout.decode("utf-8")
        .strip()
    )

    monitor_list = json.loads(monitor_list)
    for monitor in monitor_list:
        if monitor["focused"] == True:
            return [monitor["name"], monitor["activeWorkspace"]["id"]]
    return []


currWorkspace = int(current_focus_workspace()[1])
currMonitor = current_focus_workspace()[0]

workspacesList = json.loads(subprocess.run(
    "hyprctl -j workspaces".split(), stdout=subprocess.PIPE)
    .stdout.decode("utf-8")
    .strip()
)

workSpacesOfMonitor = list(filter(
    lambda workspace: workspace["monitor"] == currMonitor, workspacesList))

workSpacesOfMonitor.sort(
    key=(lambda workspace: int(workspace["id"])), reverse=True)

highestWorkspaceOnMonitor = workSpacesOfMonitor[0]

if highestWorkspaceOnMonitor["id"] > currWorkspace:
    if "--with-window" in sys.argv:
        subprocess.run("hyprctl dispatch movetoworkspace m+1".split())
    else:
        subprocess.run("hyprctl dispatch workspace m+1".split())
else:
    workspacesList.sort(
        key=(lambda workspace: workspace["id"]), reverse=True)
    highestWorkspaceID = workspacesList[0]["id"]

    if "--with-window" in sys.argv:
        subprocess.run(
            f"hyprctl dispatch movetoworkspace {highestWorkspaceID + 1}".split())
    else:
        subprocess.run(
            f"hyprctl dispatch workspace {highestWorkspaceID + 1}".split())
    subprocess.run(
        f"hyprctl dispatch moveworkspacetomonitor {highestWorkspaceID + 1} {currMonitor}".split())
