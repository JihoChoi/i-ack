
# i-ACK

:triangular_flag_on_post::o: Implicit ACK

Newcomer's Project for SNU CSE SCONE

<!--
	Social & Computer Network Lab  
	Computer Science & Engineering  
	Seoul National University  
-->

### Contributors  
- [Jiho Choi](https://github.com/jihochoi)
- [Onyu Kang](https://github.com/onyukang)


### Installation & Instructions

> [Installation]()  
> [Instructions]()  


### Project Overview

Modify OpenWrt for routers to generate L2 ACK and send the ACK to senders to improve throughput

***Default OpenWrt*** 
```
    [Server]  <------>  [AP]  <------>  [Client]

        | <----- REQ ---- | <----- REQ ---- |

        | ----- DATA ---> | ----- DATA ---> |

                          | <-- L2 ACK ---- |

          <-- L4 ACK ---- | <-- L4 ACK ---- |

```

***Modified***  
```
    [Server]  <------>  [AP]  <------>  [Client]

        x <----- REQ ---- x <----- REQ ---- x

        x ----- DATA ---> x ----- DATA ---> x

                     [DET DATA]
                          $
                    [GEN L4 ACK]

                          x <-- L2 ACK ---- x

                    [DET L2 ACK]
                          $
                    [SND L4 ACK]

        x <--- F-ACK ---- x

                          x <-- L4 ACK ---- x
                      
                      [IGNORE]

```


### OpenWrt Structure  

(Open Embedded System for Wireless Routers)

[Stack Overflow](https://stackoverflow.com/questions/26030670/openwrt-buildroot-build-dir-and-staging-dir#)  


##### ./build_dir  
is used to **upack** all the source archives and to compile them

- host
- toolchain
- target

##### ./staging_dir  
is used to **install** all the compiled programs into or for preparing the firmware image

- host
- toolchain
- target

### Background Information

**Network Layers - Open Systems Interconnection Model (OSI Model)**

| Layer | Name           |Protocols|          |                             |
|:-----:|:---------------|:-------:|---------:|----------------------------:|
| L7    | Application    | FTP     | Data     |                        Data |
| (L6)  | (Presentation) |         |          |                             |
| (L5)  | (Session)      |         |          |                             |
| L4    | Transport      | TCP     | Segments |                 TCPH + Data |
| L3    | Network        | IPv4    | Packets  |           IPH + TCPH + Data |
| L2    | Data Link      | MAC     | Frames   | FH + IPH + TCPH + Data + FF |
| L1    | Physical       |         | Bits     |                             |

**Wireless Network - IEEE802.11**  

- L2 ACK : MAC ACK for Wireless (Wi-Fi) Connection  
- L4 ACK : TCP ACK

**TCP Congestion Control**  

- .

### References
- [OpenWrt](https://openwrt.org/)
- [OpenWrt Wiki](https://wiki.openwrt.org/doc/start)
	- [Build System](https://wiki.openwrt.org/about/toolchain)
	- [Cross Compile](https://wiki.openwrt.org/doc/devel/crosscompile)
- [OpenWrt Structure](https://stackoverflow.com/questions/26030670/openwrt-buildroot-build-dir-and-staging-dir#)
- [IP Spoofing](http://www.insecure.in/ip_spoofing.asp)
- [Wireless MAC](https://hewlettpackard.github.io/wireless-tools/Linux.Wireless.mac.html)
- [Gyumin Sim's Wiki](https://github.com/sim0629/openwrt/wiki)


