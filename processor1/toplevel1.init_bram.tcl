cd C:/Users/chribru/Desktop/GitHub/tdt4255/processor1/toplevel1
if { [ catch { xload xmp toplevel1.xmp } result ] } {
  exit 10
}
if { [catch {run init_bram} result] } {
  exit -1
}
exit 0
