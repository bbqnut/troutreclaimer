# troutrec.tcl
# trout reclaimer v0.1a by bbqnut
set cmdchar "."
bind pub - ${cmdchar}troutsaved trout_sav
bind CTCP - ACTION trout_rec
set trouty "2023"
proc trout_sav {nick mask hand channel args} {
  global trouty
  set troutsf "scripts/troutr.txt"
  set troutsa [open $troutsf]
  set troutss [gets $troutsa]
  close $troutsa
  set troutsavmsg "$troutss trout saved since $trouty"
  putquick "PRIVMSG $channel :$troutsavmsg"
}
proc trout_rec {nick uhost hand dest key arg} {
  if {![isbotnick $nick] && [string match -nocase *slaps* $arg] && [string match -nocase *trout* $arg]} {
    global trouttake
    global troutdo
    global trouty
    set chan [string tolower $dest]
    set trout1 [lindex $trouttake [rand [llength $trouttake]]]
    set trout2 [lindex $troutdo [rand [llength $troutdo]]]
    set filename "scripts/troutr.txt"
    set file_handle [open $filename r+]
    set data [gets $file_handle]
    set data_new [expr $data +1]
    seek $file_handle 0
    puts $file_handle $data_new
    close $file_handle
    set troutmsg "$trout1 the trout from $nick and $trout2 back in the river. \($data_new trout saved since $trouty\)"
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
