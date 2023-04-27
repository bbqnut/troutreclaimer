# troutrec.tcl
# trout reclaimer v0.1a by bbqnut
bind CTCP - ACTION trout_rec
proc trout_rec {nick uhost hand dest key arg} {
  if {![isbotnick $nick] && [string match -nocase *slaps* $arg] && [string match -nocase *trout* $arg]} {
    global trouttake
    global troutdo
    set trouty "2023"
    set chan [string tolower $dest]
    set trout1 [lindex $trouttake [rand [llength $trouttake]]]
    set trout2 [lindex $troutdo [rand [llength $troutdo]]]
    set troutf "scripts/troutr.txt"
    set trouta [open $troutf w+]
    set trouts [gets $trouta]
    set troutr [expr $trouts + 1]
    seek $trouta 0
    puts $trouta $troutr
    close $trouta
    set troutmsg "$trout1 the trout from $nick and $trout2 back in the river. \($troutr trout saved since $trouty\)"
    putquick "PRIVMSG $chan :\001ACTION $troutmsg\001"
  }
}
set trouttake {
{grabs}
{snatches}
{takes}
{absconds}
{repossesses}
{takes back}
{seizes}
{plucks}
{nabs}
{grasps}
{rips}
{yanks}
{clutches}
{grips}
{collars}
}
set troutdo {
{tosses it}
{throws it}
{flips the thing}
{boomerangs the poor soul}
{backflips it}
{backflips the shiny fish}
{torpedos it}
{reverse slams it}
{punts it}
{spins it}
{releases it}
{bellyflops the poor fish}
}
putlog "trout reclaimer v0.1a loaded"
