![giphy](https://github.com/user-attachments/assets/53dad946-ea65-4f40-82f5-269a15b44483)

<a href='https://ko-fi.com/F1F61V3VOV' target='_blank'><img height='36' style='border:0px;height:36px;' src='https://storage.ko-fi.com/cdn/kofi5.png?v=6' border='0' alt='Buy Me a Coffee at ko-fi.com' /></a>

- PLEASE CHECK MY SPECS IN MY OTHER GITHUB REPO SO YOU KNOW THE HARDWARE I USE FOR THESE TWEAKS, THANKS

- ALWAYS CREATE A RESTORE POINT BEFORE DOING ANY TWEAKS OR OPTIMIZATIONS

*(make sure your ethernet drivers are updated by going to your motherboards website and download the most recent ethernet/network drivers)*

- go to ethernet properties in controll panel - Control Panel > Network & Internet > Network & Sharing Center > Ethernet > Properties
turn of everything exept for IPV4 (if you live in a house with other people using wifi and have less then 500mbps download speed leave QOS Packet Scheduler ON)

----------------------------------------------------------

- download tpc optimzer - https://www.speedguide.net/downloads.php
start as admin

// GENERAL SETTINGS

max connection speed

check optimal at bottem hit apply changes dont restart, 

then check custom at the bottem change these settings: 

tcp window auto-tuning: normal

windows scaling: disabled

congestion control: CUBIC or NONE (try what works best for u)

RSS: disable

RSC: disable

ECN: disable

Checksum: disable

TCP Chimney: disable

LSO: disable

TCP 1323: disable

//ADVANCED SETTINGS

QOS NLA: optimal 1

Network Throttle: disable fffffff

System Resposiveness: gaming: 0

TCP ACK: disable

TCP No Delay: disable

TCP Del Ack: disable

Large System Cache: disable

NON Sack RTT: disable

// NOW RESTART YOUR COMPUTER

-------------------------------------

- Next go to Control Panel > Network & Internet > Network & Sharing Center > Ethernet > Properties > Configure

/// DISABLE ALL THESE SETTINGS BELOW

ARP OFFLOAD

FLOW CONTROL

INTERRUPT MODERATION

IPV4 CHECKSUM OFFLOAD

JUMBO FRAME

LARGE SEND OFFLOAD V2 IPV4 and IPV6

NS OFFLOAD

RECV SEGMENT COALESCING IPV4 and IPV6

SHUTDOWN WAKE ON LAN

TCP CHECKSUM OFFLOAD IPV4 and IPV6

UDP CHECKSUM OFFLOAD IPV4 and IPV6

WAKE ON MAGIC PACKET 

WAKE ON PATTERN MATCH

------------------------------------------

- next run the NETWORK TWEAKER.ps1 with powershell in admin

select your adapter from the top left

disable all setting under POWER SAVING SETTINGS

and disable Network Direct and Task Offload in GLOBAL SETTINGS 

// THEN RESTART

Go to Group Policy Editor > Local Computer Policy > Administrative Templates > Network > QoS Packet Scheduler > CLick on Limit Reversable Bandwidth, Enable it and set it to 0% in "Bandwidth Limit %"

// THEN RESTART AGAIN

// THATS ALL THE TWEAKS, THIS WILL BE UPDATED WITH ANYTHING NEW OR SOMTHING I FIND THAT I START USING DAILY
