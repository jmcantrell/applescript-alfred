on get_screen()
    tell application "Finder"
        return bounds of window of desktop
    end tell
end get_screen

on resize(loc)
    set perc to 0.9
    set front_app to (path to frontmost application as Unicode text)
    tell application front_app
        set app_bounds to bounds of window 1
        set screen to my get_screen()
        set sx to item 1 of screen
        set sy to item 2 of screen
        set sw to item 3 of screen
        set sh to item 4 of screen
        activate
        if loc is "tr" then
            set x to sx + sw / 3
            set y to sy
            set w to sw + sx
            set h to sy + sh / 2
        else if loc is "tl" then
            set x to sx
            set y to sy
            set w to sx + sw / 3
            set h to sy + sh / 2
        else if loc is "bl" then
            set x to sx
            set y to sy + sh / 2
            set w to sx + sw / 3
            set h to sy + sh
        else if loc is "br" then
            set x to sx + sw / 3
            set y to sy + sh / 2
            set w to sx + sw
            set h to sy + sh
        else if loc is "t" then
            set x to sx
            set y to sy
            set w to sx + sw
            set h to sy + sh / 2
        else if loc is "r" then
            set x to sx + sw / 3
            set y to sy
            set w to sx + sw
            set h to sy + sh
        else if loc is "l" then
            set x to sx
            set y to sy
            set w to sx + sw / 3
            set h to sy + sh
        else if loc is "b" then
            set x to sx
            set y to sy + sh / 2
            set w to sx + sw
            set h to sy + sh
        else if loc is "c" then
            set x to sx + sw * (1 - perc)
            set y to sy + sh * (1 - perc)
            set w to sx + sw * perc
            set h to sy + sh * perc
        else if loc is "f" then
            set x to sx
            set y to sy
            set w to sx + sw
            set h to sy + sh
        end if
        set bounds of window 1 to {x, y, w, h}
    end tell
end resize

on alfred_script(loc)
    resize(loc)
end alfred_script

--uncomment these lines to use for command line
--on run argv
--    resize(item 1 of argv)
--end run

--this can be changed to f,t,b,l,r,tl,tr,bl,br,c,reset
--resize("c")
