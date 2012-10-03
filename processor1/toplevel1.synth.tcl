proc pnsynth {} {
  cd C:/Users/chribru/Desktop/GitHub/tdt4255/processor1/toplevel1
  if { [ catch { xload xmp toplevel1.xmp } result ] } {
    exit 10
  }
  if { [catch {run netlist} result] } {
    return -1
  }
  return $result
}
if { [catch {pnsynth} result] } {
  exit -1
}
exit $result
