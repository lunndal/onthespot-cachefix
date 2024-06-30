# Synopsis
Start onthespot, optionally deleting playlists or everything in the cache.

# Description
Workaround for BUG: https://github.com/casualsnek/onthespot/issues/120

# Syntax
```
.\Start-OnTheSpot.ps1
    -DeleteCahce    What parts of the cache to delete before starting onthespot.
        All         Delete entire cache. Forcing all files to be downloaded.
        Playlists   Delete only cached playlists. Will only download new files in list.
        None        (Default) Delete nothing.
    -HideConsole    Hide the log console.
    -Executable     Path and filename to onthespot executable.
    -Cache          Path to the reqcache directory.
```

# Example
```
.\Start-OnTheSpot.ps1 `
    -HideConsole `
    -DeleteCache Playlists `
    -Executable "C:\Program Files\onthespot\onthespot_win_ffm.exe"`
    -Cache "C:\Users\USERNAME\.cache\casualOnTheSpot\reqcache"
```

# Related links
* https://github.com/casualsnek/onthespot
* https://github.com/casualsnek/onthespot/issues/120
