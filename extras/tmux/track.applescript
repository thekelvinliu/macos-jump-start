set candidates to {"iTunes", "Spotify"}
repeat with cand in candidates
  using terms from application "iTunes"
    if application cand is running then
      tell application cand
        if player state is playing then
          set artistName to artist of current track
          set trackName to name of current track
          return artistName & " - " & trackName
        end if
      end tell
    end if
  end using terms from
end repeat
return ""
