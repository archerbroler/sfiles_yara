rule PoS_Malware_RawPOS2015_dumper : RawPOS2015_dumper
{
meta:
 author = "Trend Micro, Inc."
 date = "2015-03-10"
 description = "Used to detect RawPOS RAM dumper, including 2015 sample set"
 sample_filetype = "exe"
strings:
 $string1 = "(1[0-2]))([0-9]"
 $string2 = "(1[0-2]))[0-9]{8,30})"
 $string3 = "((B(([0-9]{13,16})"
 $mess1 = "Found track data at %s with PID %d"
 $mess2 = "Enter Process Id: "
 $mess3 = " Dump private process memory by PID"
 $mess4 = "Dumping private memory for pid %s to %s.dmp..."
 $mess5 = " Full private dump of all running processes"
 $memd1 = "memdump\\%s-%d.dmp"
 $memd2 = "mkdir memdump >NUL 2>NUL"
condition:
 (all of ($memd*)) and (all of ($mess*)) and (any of ($string*))
}