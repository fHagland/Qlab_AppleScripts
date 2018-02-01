(*
	Function: Controlling PJLink compatibale projectors
	Creator: Fadzil Hanafi
*)

set powerOn to "%1POWR 1"
set powerOff to "%1POWR 0"
set shutterClose to "%1AVMT 11" -- Video mute ON instruction in the PJLink specification.
set shutterOpen to "%1AVMT 10" -- Video mute OFF instruction in the PJLink specification.
set shutterCloseAudioMute to "%1AVMT 31" -- Video and audio mute ON instruction in the PJLink specification.
set shutterOpenAudioOn to "%1AVMT 30" -- Video and audio mute OFF instruction in the PJLink specification.

# Do not change anything above this line!


set theServer to "192.168.1.xxx" -- Set this to the IP address of the projector.
set theCommand to shutterCloseAudioMute -- Set the command required. (Options are: powerOn , powerOff , shutterClose , shutterOpen , shutterCloseAudioMute , shutterOpenAudioOn ) 
set thePort to "4352"

# !!! For Panasonic projectors use  shutterCloseAudioMute  and  shutterOpenAudioOn  to control the shutter.

# Do not change anything below this line!

try
	do shell script "{ echo " & theCommand & "; sleep 1;} | telnet " & theServer & " " & thePort
end try

# This script sends PJLink commands to port 4352 over Telnet. It was compiled by FED. (http://fadzilh.com)
# It is a fork of Mic Pool's original that controlled Panasonic projectors using cURL. (https://micpool.com)
# For more information on the PJLink specification visit http://pjlink.jbmia.or.jp/english/index.html

--