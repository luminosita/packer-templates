<?xml version="1.0"?>
<opnsense>
  <theme>opnsense-dark</theme>
  <sysctl version="1.0.1">
    <item uuid="2e1755c1-cc8c-4db7-bb2b-d12a02aac177">
      <tunable>vfs.read_max</tunable>
      <value/>
      <descr>Increase UFS read-ahead speeds to match the state of hard drives and NCQ.</descr>
    </item>
    <item uuid="65342ec1-7011-4c22-ac83-6e61e09bcb32">
      <tunable>net.inet.ip.portrange.first</tunable>
      <value/>
      <descr>Set the ephemeral port range to be lower.</descr>
    </item>
    <item uuid="870b6f31-bdc4-4256-a4ed-ce747482dc60">
      <tunable>net.inet.tcp.blackhole</tunable>
      <value/>
      <descr>Drop packets to closed TCP ports without returning a RST</descr>
    </item>
    <item uuid="7d68d045-f7fd-4dea-a932-bdbc6f5d8448">
      <tunable>net.inet.udp.blackhole</tunable>
      <value/>
      <descr>Do not send ICMP port unreachable messages for closed UDP ports</descr>
    </item>
    <item uuid="1f19799b-7cdc-49f4-9e6d-caaa7042945c">
      <tunable>net.inet.ip.random_id</tunable>
      <value/>
      <descr>Randomize the ID field in IP packets</descr>
    </item>
    <item uuid="2b5b6f4d-76c2-4ccf-8051-3d6154e49a7e">
      <tunable>net.inet.ip.sourceroute</tunable>
      <value/>
      <descr>
        Source routing is another way for an attacker to try to reach non-routable addresses behind your box.
        It can also be used to probe for information about your internal networks. These functions come enabled
        as part of the standard FreeBSD core system.
      </descr>
    </item>
    <item uuid="2050ccc1-674e-4577-ba6c-0bff5e2d57e5">
      <tunable>net.inet.ip.accept_sourceroute</tunable>
      <value/>
      <descr>
        Source routing is another way for an attacker to try to reach non-routable addresses behind your box.
        It can also be used to probe for information about your internal networks. These functions come enabled
        as part of the standard FreeBSD core system.
      </descr>
    </item>
    <item uuid="da7c3430-7a5f-4387-83b1-74540ef18b0a">
      <tunable>net.inet.icmp.log_redirect</tunable>
      <value/>
      <descr>
        This option turns off the logging of redirect packets because there is no limit and this could fill
        up your logs consuming your whole hard drive.
      </descr>
    </item>
    <item uuid="ae00ab47-13f4-4ac4-bde0-f3c90de20986">
      <tunable>net.inet.tcp.drop_synfin</tunable>
      <value/>
      <descr>Drop SYN-FIN packets (breaks RFC1379, but nobody uses it anyway)</descr>
    </item>
    <item uuid="fc8b49f8-7885-4033-8f00-e12184a028f6">
      <tunable>net.inet6.ip6.redirect</tunable>
      <value/>
      <descr>Enable sending IPv6 redirects</descr>
    </item>
    <item uuid="c9bc5a49-6519-429a-9e96-068e644cf056">
      <tunable>net.inet6.ip6.use_tempaddr</tunable>
      <value/>
      <descr>Enable privacy settings for IPv6 (RFC 4941)</descr>
    </item>
    <item uuid="44f108fb-5b27-468a-8a3f-9d034c0c17a2">
      <tunable>net.inet6.ip6.prefer_tempaddr</tunable>
      <value/>
      <descr>Prefer privacy addresses and use them over the normal addresses</descr>
    </item>
    <item uuid="a163f663-5252-4d1b-b5af-a46c7fee844b">
      <tunable>net.inet.tcp.syncookies</tunable>
      <value/>
      <descr>Generate SYN cookies for outbound SYN-ACK packets</descr>
    </item>
    <item uuid="28acfad7-bd99-4992-8be1-9b42ca238528">
      <tunable>net.inet.tcp.recvspace</tunable>
      <value/>
      <descr>Maximum incoming/outgoing TCP datagram size (receive)</descr>
    </item>
    <item uuid="6904bc4c-e8a6-48b7-a467-466e697c9a2c">
      <tunable>net.inet.tcp.sendspace</tunable>
      <value/>
      <descr>Maximum incoming/outgoing TCP datagram size (send)</descr>
    </item>
    <item uuid="45a3fad3-d1c1-446c-9cf7-93e4eed1297a">
      <tunable>net.inet.tcp.delayed_ack</tunable>
      <value/>
      <descr>Do not delay ACK to try and piggyback it onto a data packet</descr>
    </item>
    <item uuid="91d3d5cb-0d5e-4307-85ad-5a6172d90391">
      <tunable>net.inet.udp.maxdgram</tunable>
      <value/>
      <descr>Maximum outgoing UDP datagram size</descr>
    </item>
    <item uuid="0de671c1-c469-4b78-960e-8beaf9024b16">
      <tunable>net.link.bridge.pfil_onlyip</tunable>
      <value/>
      <descr>Handling of non-IP packets which are not passed to pfil (see if_bridge(4))</descr>
    </item>
    <item uuid="ca0a7db3-e9f4-4d7a-8005-050558bdd8c1">
      <tunable>net.link.bridge.pfil_local_phys</tunable>
      <value/>
      <descr>Set to 1 to additionally filter on the physical interface for locally destined packets</descr>
    </item>
    <item uuid="dc65cf17-d8c7-4d98-90d5-d12039c740a3">
      <tunable>net.link.bridge.pfil_member</tunable>
      <value/>
      <descr>Set to 0 to disable filtering on the incoming and outgoing member interfaces.</descr>
    </item>
    <item uuid="1332f062-e99f-48a8-8207-a9404f5ed204">
      <tunable>net.link.bridge.pfil_bridge</tunable>
      <value/>
      <descr>Set to 1 to enable filtering on the bridge interface</descr>
    </item>
    <item uuid="912ff603-010f-4fdd-a6a5-de105577bb15">
      <tunable>net.link.tap.user_open</tunable>
      <value/>
      <descr>Allow unprivileged access to tap(4) device nodes</descr>
    </item>
    <item uuid="19776099-c230-4ad1-9bbc-7c829a65f875">
      <tunable>kern.randompid</tunable>
      <value/>
      <descr>Randomize PID's (see src/sys/kern/kern_fork.c: sysctl_kern_randompid())</descr>
    </item>
    <item uuid="7e06de3d-fc00-402e-bcf6-a252ccf01377">
      <tunable>hw.syscons.kbd_reboot</tunable>
      <value/>
      <descr>Disable CTRL+ALT+Delete reboot from keyboard.</descr>
    </item>
    <item uuid="a38fcb4a-16ef-45a7-b663-0072999efbc4">
      <tunable>net.inet.tcp.log_debug</tunable>
      <value/>
      <descr>Enable TCP extended debugging</descr>
    </item>
    <item uuid="bcbf6dce-9ce1-48c9-9fa7-2ed0c12a62e8">
      <tunable>net.inet.icmp.icmplim</tunable>
      <value/>
      <descr>Set ICMP Limits</descr>
    </item>
    <item uuid="0623c61b-0e6a-4294-b070-03595ce25a01">
      <tunable>net.inet.tcp.tso</tunable>
      <value/>
      <descr>TCP Offload Engine</descr>
    </item>
    <item uuid="afc007fd-6848-4372-a777-fcbb434ce063">
      <tunable>net.inet.udp.checksum</tunable>
      <value/>
      <descr>UDP Checksums</descr>
    </item>
    <item uuid="24947413-70d8-4dd6-ae24-be742642c0c7">
      <tunable>kern.ipc.maxsockbuf</tunable>
      <value/>
      <descr>Maximum socket buffer size</descr>
    </item>
    <item uuid="be88efc3-eb6a-40d8-99b5-cda3e06271a3">
      <tunable>vm.pmap.pti</tunable>
      <value/>
      <descr>Page Table Isolation (Meltdown mitigation, requires reboot.)</descr>
    </item>
    <item uuid="03af2846-4222-4f62-9e09-f545b5418ee4">
      <tunable>hw.ibrs_disable</tunable>
      <value/>
      <descr>Disable Indirect Branch Restricted Speculation (Spectre V2 mitigation)</descr>
    </item>
    <item uuid="97a0694e-a66d-4da9-8929-ff2c8d315158">
      <tunable>security.bsd.see_other_gids</tunable>
      <value/>
      <descr>Hide processes running as other groups</descr>
    </item>
    <item uuid="a502120f-0793-4ad2-9a4f-6cdba08323bf">
      <tunable>security.bsd.see_other_uids</tunable>
      <value/>
      <descr>Hide processes running as other users</descr>
    </item>
    <item uuid="9f7011bc-4712-4f0d-9d18-cc1349f70434">
      <tunable>net.inet.ip.redirect</tunable>
      <value/>
      <descr>Enable/disable sending of ICMP redirects in response to IP packets for which a better,
        and for the sender directly reachable, route and next hop is known.
      </descr>
    </item>
    <item uuid="541e8204-b7af-48a1-974c-bdb12c8087d0">
      <tunable>net.local.dgram.maxdgram</tunable>
      <value/>
      <descr>Maximum outgoing UDP datagram size</descr>
    </item>
  </sysctl>
  <system>
    <use_mfs_tmp/>
    <use_mfs_var/>
    <serialspeed>115200</serialspeed>
    <primaryconsole>video</primaryconsole>
    <secondaryconsole>serial</secondaryconsole>
    <optimization>normal</optimization>
    <hostname>##HOSTNAME##</hostname>
    <domain>##DOMAIN##</domain>
    <group uuid="1e730bc2-864f-40af-8016-f2699acb8dec">
      <gid>1999</gid>
      <name>admins</name>
      <scope>system</scope>
      <description>System Administrators</description>
      <priv>page-all</priv>
      <member>0</member>
    </group>
    <user uuid="95c7de6e-9a70-4174-9dcd-bccabaeb2e5a">
      <uid>0</uid>
      <name>root</name>
      <disabled>0</disabled>
      <scope>system</scope>
      <expires/>
      <otp_seed/>
      <shell/>
      <password>$2y$10$YRVoF4SgskIsrXOvOQjGieB9XqHPRra9R7d80B3BZdbY/j21TwBfS</password>
      <pwd_changed_at/>
      <landing_page/>
      <comment/>
      <email/>
      <apikeys/>
      <priv/>
      <language/>
      <descr>System Administrator</descr>
      <dashboard/>
    </user>
    <nextuid>2000</nextuid>
    <nextgid>2000</nextgid>
    <timezone>Etc/UTC</timezone>
    <timeservers>0.opnsense.pool.ntp.org 1.opnsense.pool.ntp.org 2.opnsense.pool.ntp.org 3.opnsense.pool.ntp.org</timeservers>
    <webgui>
      <protocol>https</protocol>
      <ssl-certref>67fee600cdbdc</ssl-certref>
      <port/>
      <ssl-ciphers/>
      <interfaces/>
      <compression/>
      <ssl-hsts>1</ssl-hsts>
      <authmode>Local Database</authmode>
      <nodnsrebindcheck>1</nodnsrebindcheck>
      <nohttpreferercheck>1</nohttpreferercheck>
    </webgui>
    <disablenatreflection>yes</disablenatreflection>
    <usevirtualterminal>1</usevirtualterminal>
    <disableconsolemenu>1</disableconsolemenu>
    <disablevlanhwfilter>1</disablevlanhwfilter>
    <disablechecksumoffloading>1</disablechecksumoffloading>
    <disablesegmentationoffloading>1</disablesegmentationoffloading>
    <disablelargereceiveoffloading>1</disablelargereceiveoffloading>
    <ipv6allow>1</ipv6allow>
    <powerd_ac_mode>hadp</powerd_ac_mode>
    <powerd_battery_mode>hadp</powerd_battery_mode>
    <powerd_normal_mode>hadp</powerd_normal_mode>
    <bogons>
      <interval>monthly</interval>
    </bogons>
    <pf_share_forward>1</pf_share_forward>
    <lb_use_sticky>1</lb_use_sticky>
    <ssh>
      <group>admins</group>
      <noauto>1</noauto>
      <interfaces/>
      <kex/>
      <ciphers/>
      <macs/>
      <keys/>
      <keysig/>
      <rekeylimit/>
      <enabled>enabled</enabled>
      <permitrootlogin>1</permitrootlogin>
    </ssh>
    <rrdbackup>-1</rrdbackup>
    <netflowbackup>-1</netflowbackup>
    <firmware version="1.0.1">
      <mirror/>
      <flavour/>
      <plugins>os-acme-client,os-frr,os-qemu-guest-agent</plugins>
      <type/>
      <subscription/>
      <reboot/>
    </firmware>
    <disablereplyto>yes</disablereplyto>
    <maximumstates/>
    <maximumfrags/>
    <aliasesresolveinterval/>
    <maximumtableentries/>
    <pfdebug>urgent</pfdebug>
    <language>en_US</language>
    <dnsserver>##DNSSERVER##</dnsserver>
    <sudo_allow_wheel>1</sudo_allow_wheel>
    <dnsallowoverride>1</dnsallowoverride>
    <dnsallowoverride_exclude/>
    <dns1gw>none</dns1gw>
    <dns2gw>none</dns2gw>
    <dns3gw>none</dns3gw>
    <dns4gw>none</dns4gw>
    <dns5gw>none</dns5gw>
    <dns6gw>none</dns6gw>
    <dns7gw>none</dns7gw>
    <dns8gw>none</dns8gw>
  </system>
  <interfaces>
    <wan>
      <if>vtnet0</if>
      <descr/>
      <enable>1</enable>
      <lock>1</lock>
      <spoofmac/>
      <blockbogons>1</blockbogons>
      <ipaddr>##WANIP##</ipaddr>
      <subnet>24</subnet>
      <gateway>WAN_GW</gateway>
    </wan>
    <lan>
      <if>vtnet1</if>
      <descr>LAN</descr>
      <enable>1</enable>
      <spoofmac/>
      <ipaddr>##LANNET##.1.1</ipaddr>
      <subnet>24</subnet>
    </lan>
    <lo0>
      <internal_dynamic>1</internal_dynamic>
      <descr>Loopback</descr>
      <enable>1</enable>
      <if>lo0</if>
      <ipaddr>127.0.0.1</ipaddr>
      <ipaddrv6>::1</ipaddrv6>
      <subnet>8</subnet>
      <subnetv6>128</subnetv6>
      <type>none</type>
      <virtual>1</virtual>
    </lo0>
    <opt1>
      <if>vlan01</if>
      <descr>USER</descr>
      <enable>1</enable>
      <lock>1</lock>
      <spoofmac/>
      <ipaddr>##LANNET##.10.1</ipaddr>
      <subnet>24</subnet>
    </opt1>
    <opt2>
      <if>vlan02</if>
      <descr>DMZ</descr>
      <enable>1</enable>
      <lock>1</lock>
      <spoofmac/>
      <ipaddr>##LANNET##.20.1</ipaddr>
      <subnet>24</subnet>
    </opt2>
    <opt3>
      <if>vlan03</if>
      <descr>GUEST</descr>
      <enable>1</enable>
      <lock>1</lock>
      <spoofmac/>
      <ipaddr>##LANNET##.30.1</ipaddr>
      <subnet>24</subnet>
    </opt3>
    <Private>
      <internal_dynamic>1</internal_dynamic>
      <enable>1</enable>
      <networks/>
      <if>Private</if>
      <descr>Private</descr>
      <virtual>1</virtual>
      <type>group</type>
    </Private>
  </interfaces>
  <dhcpd>
    <lan>
      <enable>1</enable>
      <ddnsdomainalgorithm>hmac-md5</ddnsdomainalgorithm>
      <numberoptions>
        <item/>
      </numberoptions>
      <range>
        <from>##LANNET##.1.100</from>
        <to>##LANNET##.1.199</to>
      </range>
      <winsserver/>
      <dnsserver>##LANNET##.1.1</dnsserver>
      <ntpserver/>
    </lan>
    <opt2>
      <enable>1</enable>
      <ddnsdomainalgorithm>hmac-md5</ddnsdomainalgorithm>
      <numberoptions>
        <item/>
      </numberoptions>
      <range>
        <from>##LANNET##.20.100</from>
        <to>##LANNET##.20.199</to>
      </range>
      <winsserver/>
      <dnsserver>##LANNET##.20.1</dnsserver>
      <ntpserver/>
    </opt2>
    <opt3>
      <enable>1</enable>
      <ddnsdomainalgorithm>hmac-md5</ddnsdomainalgorithm>
      <numberoptions>
        <item/>
      </numberoptions>
      <range>
        <from>##LANNET##.30.100</from>
        <to>##LANNET##.30.199</to>
      </range>
      <winsserver/>
      <dnsserver/>
      <ntpserver/>
    </opt3>
    <opt1>
      <enable>1</enable>
      <ddnsdomainalgorithm>hmac-md5</ddnsdomainalgorithm>
      <numberoptions>
        <item/>
      </numberoptions>
      <range>
        <from>##LANNET##.10.100</from>
        <to>##LANNET##.10.199</to>
      </range>
      <winsserver/>
      <dnsserver/>
      <ntpserver/>
    </opt1>
  </dhcpd>
  <snmpd>
    <syslocation/>
    <syscontact/>
    <rocommunity>public</rocommunity>
  </snmpd>
  <nat>
    <outbound>
      <mode>automatic</mode>
    </outbound>
    <rule/>
  </nat>
  <filter>
    <rule uuid="2f68fbe0-b511-4426-bf18-f0ced7f8320c">
      <type>pass</type>
      <interface>wan</interface>
      <ipprotocol>inet</ipprotocol>
      <statetype>keep state</statetype>
      <direction>in</direction>
      <quick>1</quick>
      <protocol>tcp</protocol>
      <source>
        <network>wan</network>
      </source>
      <destination>
        <network>wanip</network>
        <port>443</port>
      </destination>
    </rule>
    <rule uuid="bb0780c8-72d0-46de-9638-c8f6d1e7840c">
      <type>pass</type>
      <interface>wan</interface>
      <ipprotocol>inet</ipprotocol>
      <statetype>keep state</statetype>
      <direction>in</direction>
      <quick>1</quick>
      <protocol>tcp</protocol>
      <source>
        <network>wan</network>
      </source>
      <destination>
        <network>wanip</network>
        <port>22</port>
      </destination>
    </rule>
    <rule uuid="55b2a76e-2378-4a39-ba6d-d44304419789">
      <type>pass</type>
      <interface>lan</interface>
      <ipprotocol>inet</ipprotocol>
      <statetype>keep state</statetype>
      <descr>Allow DNS queries</descr>
      <direction>in</direction>
      <quick>1</quick>
      <protocol>udp</protocol>
      <source>
        <network>lan</network>
      </source>
      <destination>
        <network>lanip</network>
        <port>53</port>
      </destination>
    </rule>
    <rule uuid="42fb3a85-e836-4474-8767-b3177aef1163">
      <type>pass</type>
      <interface>lan</interface>
      <ipprotocol>inet</ipprotocol>
      <statetype>keep state</statetype>
      <descr>Allow PING queries</descr>
      <direction>in</direction>
      <quick>1</quick>
      <protocol>icmp</protocol>
      <source>
        <network>lan</network>
      </source>
      <destination>
        <any>1</any>
      </destination>
    </rule>
    <rule uuid="6a803c03-6bd1-4aa3-810a-5933fccb6922">
      <type>pass</type>
      <interface>lan</interface>
      <ipprotocol>inet</ipprotocol>
      <statetype>keep state</statetype>
      <descr>Allow LAN SSH access</descr>
      <direction>in</direction>
      <quick>1</quick>
      <protocol>tcp</protocol>
      <source>
        <network>lan</network>
      </source>
      <destination>
        <network>opt2</network>
        <port>22</port>
      </destination>
    </rule>
    <rule uuid="4fda6ec3-3eda-4fbd-89e5-6be355fb6182">
      <type>pass</type>
      <interface>lan</interface>
      <ipprotocol>inet</ipprotocol>
      <statetype>keep state</statetype>
      <descr>Allow LAN Vault access</descr>
      <direction>in</direction>
      <quick>1</quick>
      <protocol>tcp</protocol>
      <source>
        <network>lan</network>
      </source>
      <destination>
        <network>opt2</network>
        <port>8200</port>
      </destination>
    </rule>
    <rule uuid="47b7c38b-faa7-413b-9736-1d5ad4065913">
      <type>pass</type>
      <interface>lan</interface>
      <ipprotocol>inet</ipprotocol>
      <statetype>keep state</statetype>
      <descr>Allow access to internet and block access to private networks</descr>
      <direction>in</direction>
      <quick>1</quick>
      <source>
        <network>lan</network>
      </source>
      <destination>
        <network>Private</network>
        <not>1</not>
      </destination>
    </rule>
    <rule uuid="9d1926f5-4d78-402e-b2d2-42925a743c52">
      <type>pass</type>
      <ipprotocol>inet</ipprotocol>
      <descr>Default allow LAN to any rule</descr>
      <interface>lan</interface>
      <source>
        <network>lan</network>
      </source>
      <destination>
        <any/>
      </destination>
      <disabled>1</disabled>
    </rule>
    <rule uuid="475d713e-d938-4a88-b868-0a964aa044a2">
      <type>pass</type>
      <ipprotocol>inet6</ipprotocol>
      <descr>Default allow LAN IPv6 to any rule</descr>
      <interface>lan</interface>
      <source>
        <network>lan</network>
      </source>
      <destination>
        <any/>
      </destination>
      <disabled>1</disabled>
    </rule>
    <rule uuid="b188e87d-8103-4c91-a5fe-4dd69d769a66">
      <type>pass</type>
      <interface>opt1</interface>
      <ipprotocol>inet</ipprotocol>
      <statetype>keep state</statetype>
      <descr>Allow DNS queries</descr>
      <direction>in</direction>
      <quick>1</quick>
      <protocol>udp</protocol>
      <source>
        <network>opt1</network>
      </source>
      <destination>
        <network>opt1ip</network>
        <port>53</port>
      </destination>
    </rule>
    <rule uuid="9f421ac2-ee41-484a-af61-8ddbe8bbe5c7">
      <type>pass</type>
      <interface>opt1</interface>
      <ipprotocol>inet</ipprotocol>
      <statetype>keep state</statetype>
      <descr>Allow PING queries</descr>
      <direction>in</direction>
      <quick>1</quick>
      <protocol>icmp</protocol>
      <source>
        <network>opt1</network>
      </source>
      <destination>
        <network>opt1ip</network>
      </destination>
    </rule>
    <rule uuid="de0e3e3f-11c1-4c59-af06-23d8a8ae916f">
      <type>pass</type>
      <interface>opt1</interface>
      <ipprotocol>inet</ipprotocol>
      <statetype>keep state</statetype>
      <descr>Allow PING queries to DMZ net</descr>
      <direction>in</direction>
      <quick>1</quick>
      <protocol>icmp</protocol>
      <source>
        <network>opt1</network>
      </source>
      <destination>
        <network>opt2</network>
      </destination>
    </rule>
    <rule uuid="c73d5bba-0959-4fc3-b543-130e238beede">
      <type>pass</type>
      <interface>opt1</interface>
      <ipprotocol>inet</ipprotocol>
      <statetype>keep state</statetype>
      <descr>Allow access to internet and block access to private networks</descr>
      <direction>in</direction>
      <quick>1</quick>
      <source>
        <network>opt1</network>
      </source>
      <destination>
        <network>Private</network>
        <not>1</not>
      </destination>
    </rule>
    <rule uuid="284ce95c-1eae-41c1-9c89-b7d6964eb3cd">
      <type>pass</type>
      <interface>opt2</interface>
      <ipprotocol>inet</ipprotocol>
      <statetype>keep state</statetype>
      <descr>Allow DNS queries</descr>
      <direction>in</direction>
      <quick>1</quick>
      <protocol>udp</protocol>
      <source>
        <network>opt2</network>
      </source>
      <destination>
        <network>opt2ip</network>
        <port>53</port>
      </destination>
    </rule>
    <rule uuid="447d1322-ac54-4af4-b2fe-39a0559c73e3">
      <type>pass</type>
      <interface>opt2</interface>
      <ipprotocol>inet</ipprotocol>
      <statetype>keep state</statetype>
      <descr>Allow inbound BGP traffic from peer</descr>
      <direction>in</direction>
      <quick>1</quick>
      <protocol>tcp</protocol>
      <source>
        <network>opt2</network>
      </source>
      <destination>
        <network>opt2</network>
        <port>179</port>
      </destination>
    </rule>
    <rule uuid="bac0a648-b08b-4f76-a5ff-aa24f3102c84">
      <type>pass</type>
      <interface>opt2</interface>
      <ipprotocol>inet</ipprotocol>
      <statetype>keep state</statetype>
      <descr>Allow PING queries</descr>
      <direction>in</direction>
      <quick>1</quick>
      <protocol>icmp</protocol>
      <source>
        <network>opt2</network>
      </source>
      <destination>
        <network>opt2</network>
      </destination>
    </rule>
    <rule uuid="a545dbf1-5b68-4e7e-9cc9-77b699a43b82">
      <type>pass</type>
      <interface>opt2</interface>
      <ipprotocol>inet</ipprotocol>
      <statetype>keep state</statetype>
      <descr>Allow access to internet and block access to private networks</descr>
      <direction>in</direction>
      <quick>1</quick>
      <source>
        <network>opt2</network>
      </source>
      <destination>
        <network>Private</network>
        <not>1</not>
      </destination>
    </rule>
    <rule uuid="a0d2e4ab-213d-47b3-a5da-7644f4ba62b1">
      <type>pass</type>
      <interface>opt3</interface>
      <ipprotocol>inet</ipprotocol>
      <statetype>keep state</statetype>
      <descr>Allow DNS queries</descr>
      <direction>in</direction>
      <quick>1</quick>
      <protocol>udp</protocol>
      <source>
        <network>opt3</network>
      </source>
      <destination>
        <network>opt3ip</network>
        <port>53</port>
      </destination>
    </rule>
    <rule uuid="7ef6e426-d932-460d-abbf-15dcd4e1f453">
      <type>pass</type>
      <interface>opt3</interface>
      <ipprotocol>inet</ipprotocol>
      <statetype>keep state</statetype>
      <descr>Allow access to internet and block access to private networks</descr>
      <direction>in</direction>
      <quick>1</quick>
      <source>
        <network>opt3</network>
      </source>
      <destination>
        <network>Private</network>
        <not>1</not>
      </destination>
    </rule>
  </filter>
  <ntpd>
    <prefer>0.opnsense.pool.ntp.org</prefer>
  </ntpd>
  <OPNsense>
    <captiveportal version="1.0.3">
      <zones/>
      <templates/>
    </captiveportal>
    <cron version="1.0.4">
      <jobs/>
    </cron>
    <DHCRelay version="1.0.1"/>
    <Firewall>
      <Lvtemplate version="0.0.1">
        <templates/>
      </Lvtemplate>
      <Alias version="1.0.1">
        <geoip>
          <url/>
        </geoip>
        <aliases>
          <alias uuid="357a804d-c9fb-409b-8bf6-93fb5b95ec84">
            <enabled>1</enabled>
            <name>PrivateNetworks</name>
            <type>network</type>
            <path_expression/>
            <proto/>
            <interface/>
            <counters>0</counters>
            <updatefreq/>
            <content>10.0.0.0/8
172.16.0.0/12
192.168.0.0/16</content>
            <password/>
            <username/>
            <authtype/>
            <categories/>
            <description>All private IP addresses</description>
          </alias>
          <alias uuid="32a69ebe-5ce9-4e10-aa4a-22749ff98b56">
            <enabled>1</enabled>
            <name>BGPNetworks</name>
            <type>network</type>
            <path_expression/>
            <proto/>
            <interface/>
            <counters>0</counters>
            <updatefreq/>
            <content>172.17.1.0/24
172.17.20.0/24</content>
            <password/>
            <username/>
            <authtype/>
            <categories/>
            <description/>
          </alias>
        </aliases>
      </Alias>
      <Category version="1.0.0">
        <categories/>
      </Category>
      <Filter version="1.0.4">
        <rules/>
        <snatrules/>
        <npt/>
        <onetoone/>
      </Filter>
    </Firewall>
    <Netflow version="1.0.1">
      <capture>
        <interfaces/>
        <egress_only/>
        <version>v9</version>
        <targets/>
      </capture>
      <collect>
        <enable>0</enable>
      </collect>
      <activeTimeout>1800</activeTimeout>
      <inactiveTimeout>15</inactiveTimeout>
    </Netflow>
    <IDS version="1.1.0">
      <rules/>
      <policies/>
      <userDefinedRules/>
      <files/>
      <fileTags/>
      <general>
        <enabled>0</enabled>
        <ips>0</ips>
        <promisc>0</promisc>
        <interfaces>wan</interfaces>
        <homenet>192.168.0.0/16,10.0.0.0/8,172.16.0.0/12</homenet>
        <defaultPacketSize/>
        <UpdateCron/>
        <AlertLogrotate>W0D23</AlertLogrotate>
        <AlertSaveLogs>4</AlertSaveLogs>
        <MPMAlgo/>
        <detect>
          <Profile/>
          <toclient_groups/>
          <toserver_groups/>
        </detect>
        <syslog>0</syslog>
        <syslog_eve>0</syslog_eve>
        <LogPayload>0</LogPayload>
        <verbosity/>
        <eveLog>
          <http>
            <enable>0</enable>
            <extended>0</extended>
            <dumpAllHeaders/>
          </http>
          <tls>
            <enable>0</enable>
            <extended>0</extended>
            <sessionResumption>0</sessionResumption>
            <custom/>
          </tls>
        </eveLog>
      </general>
    </IDS>
    <IPsec version="1.0.4">
      <general>
        <enabled/>
        <preferred_oldsa>0</preferred_oldsa>
        <disablevpnrules>0</disablevpnrules>
        <passthrough_networks/>
        <user_source/>
        <local_group/>
      </general>
      <charon>
        <max_ikev1_exchanges/>
        <threads>16</threads>
        <ikesa_table_size>32</ikesa_table_size>
        <ikesa_table_segments>4</ikesa_table_segments>
        <init_limit_half_open>1000</init_limit_half_open>
        <ignore_acquire_ts>1</ignore_acquire_ts>
        <install_routes>0</install_routes>
        <cisco_unity>0</cisco_unity>
        <make_before_break/>
        <retransmit_tries/>
        <retransmit_timeout/>
        <retransmit_base/>
        <retransmit_jitter/>
        <retransmit_limit/>
        <syslog>
          <daemon>
            <ike_name>1</ike_name>
            <log_level>0</log_level>
            <app>1</app>
            <asn>1</asn>
            <cfg>1</cfg>
            <chd>1</chd>
            <dmn>1</dmn>
            <enc>1</enc>
            <esp>1</esp>
            <ike>1</ike>
            <imc>1</imc>
            <imv>1</imv>
            <job>1</job>
            <knl>1</knl>
            <lib>1</lib>
            <mgr>1</mgr>
            <net>1</net>
            <pts>1</pts>
            <tls>1</tls>
            <tnc>1</tnc>
          </daemon>
        </syslog>
        <plugins>
          <attr>
            <subnet/>
            <split-include/>
            <x_28674/>
            <x_28675/>
            <x_25/>
            <x_28672/>
            <x_28673>0</x_28673>
            <x_28679/>
            <dns/>
            <nbns/>
          </attr>
          <eap-radius>
            <servers/>
            <accounting>0</accounting>
            <class_group>0</class_group>
          </eap-radius>
          <xauth-pam>
            <pam_service>ipsec</pam_service>
            <session>0</session>
            <trim_email>1</trim_email>
          </xauth-pam>
        </plugins>
      </charon>
      <keyPairs/>
      <preSharedKeys/>
    </IPsec>
    <Swanctl version="1.0.0">
      <Connections/>
      <locals/>
      <remotes/>
      <children/>
      <Pools/>
      <VTIs/>
      <SPDs/>
    </Swanctl>
    <Interfaces>
      <loopbacks version="1.0.0"/>
      <neighbors version="1.0.0"/>
      <vxlans version="1.0.2"/>
    </Interfaces>
    <Kea>
      <ctrl_agent version="0.0.1">
        <general>
          <enabled>0</enabled>
          <http_host>127.0.0.1</http_host>
          <http_port>8000</http_port>
        </general>
      </ctrl_agent>
      <dhcp4 version="1.0.3">
        <general>
          <enabled>0</enabled>
          <interfaces/>
          <valid_lifetime>4000</valid_lifetime>
          <fwrules>1</fwrules>
          <dhcp_socket_type>raw</dhcp_socket_type>
        </general>
        <ha>
          <enabled>0</enabled>
          <this_server_name/>
          <max_unacked_clients>2</max_unacked_clients>
        </ha>
        <subnets/>
        <reservations/>
        <ha_peers/>
      </dhcp4>
    </Kea>
    <monit version="1.0.13">
      <general>
        <enabled>0</enabled>
        <interval>120</interval>
        <startdelay>120</startdelay>
        <mailserver>127.0.0.1</mailserver>
        <port>25</port>
        <username/>
        <password/>
        <ssl>0</ssl>
        <sslversion>auto</sslversion>
        <sslverify>1</sslverify>
        <logfile/>
        <statefile/>
        <eventqueuePath/>
        <eventqueueSlots/>
        <httpdEnabled>0</httpdEnabled>
        <httpdUsername>root</httpdUsername>
        <httpdPassword/>
        <httpdPort>2812</httpdPort>
        <httpdAllow/>
        <mmonitUrl/>
        <mmonitTimeout>5</mmonitTimeout>
        <mmonitRegisterCredentials>1</mmonitRegisterCredentials>
      </general>
      <alert uuid="1ddffdba-bcd0-46cc-8349-30f0001236a5">
        <enabled>0</enabled>
        <recipient>root@localhost.local</recipient>
        <noton>0</noton>
        <events/>
        <format/>
        <reminder/>
        <description/>
      </alert>
      <service uuid="8b20aaa5-835a-45e7-9c17-ced5e187a6e9">
        <enabled>1</enabled>
        <name>$HOST</name>
        <description/>
        <type>system</type>
        <pidfile/>
        <match/>
        <path/>
        <timeout>300</timeout>
        <starttimeout>30</starttimeout>
        <address/>
        <interface/>
        <start/>
        <stop/>
        <tests>dcb3ef25-3696-4ce9-9fe1-a530ee4c8132,7ad667ba-c53d-4c7a-be48-3cbec6ebb174,f8eca41d-838d-4278-befe-dff825e60c2b,7a01a55e-f36c-478c-acf0-b2b87cf92e93</tests>
        <depends/>
        <polltime/>
      </service>
      <service uuid="3d59a633-8f1b-45a3-b690-8109c0986252">
        <enabled>1</enabled>
        <name>RootFs</name>
        <description/>
        <type>filesystem</type>
        <pidfile/>
        <match/>
        <path>/</path>
        <timeout>300</timeout>
        <starttimeout>30</starttimeout>
        <address/>
        <interface/>
        <start/>
        <stop/>
        <tests>e758fec5-b072-4360-9f66-b04d8959b796</tests>
        <depends/>
        <polltime/>
      </service>
      <service uuid="33c931cd-10e0-434f-9fe7-b3916772d07b">
        <enabled>0</enabled>
        <name>carp_status_change</name>
        <description/>
        <type>custom</type>
        <pidfile/>
        <match/>
        <path>/usr/local/opnsense/scripts/OPNsense/Monit/carp_status</path>
        <timeout>300</timeout>
        <starttimeout>30</starttimeout>
        <address/>
        <interface/>
        <start/>
        <stop/>
        <tests>c2e6c766-e276-4881-9de5-f6b73d4f1a97</tests>
        <depends/>
        <polltime/>
      </service>
      <service uuid="d3d599fb-61cc-4573-a1af-274f944ebbd3">
        <enabled>0</enabled>
        <name>gateway_alert</name>
        <description/>
        <type>custom</type>
        <pidfile/>
        <match/>
        <path>/usr/local/opnsense/scripts/OPNsense/Monit/gateway_alert</path>
        <timeout>300</timeout>
        <starttimeout>30</starttimeout>
        <address/>
        <interface/>
        <start/>
        <stop/>
        <tests>305c51c3-9761-41bd-91fb-347d1362bb87</tests>
        <depends/>
        <polltime/>
      </service>
      <test uuid="fa74f3dc-c253-4413-98b6-50b465fda4c8">
        <name>Ping</name>
        <type>NetworkPing</type>
        <condition>failed ping</condition>
        <action>alert</action>
        <path/>
      </test>
      <test uuid="ac0947f3-9f70-4357-853c-bb8f2f1597a8">
        <name>NetworkLink</name>
        <type>NetworkInterface</type>
        <condition>failed link</condition>
        <action>alert</action>
        <path/>
      </test>
      <test uuid="e7cb2b0a-ce40-4302-ba14-3282c2648e97">
        <name>NetworkSaturation</name>
        <type>NetworkInterface</type>
        <condition>saturation is greater than 75%</condition>
        <action>alert</action>
        <path/>
      </test>
      <test uuid="dcb3ef25-3696-4ce9-9fe1-a530ee4c8132">
        <name>MemoryUsage</name>
        <type>SystemResource</type>
        <condition>memory usage is greater than 75%</condition>
        <action>alert</action>
        <path/>
      </test>
      <test uuid="7ad667ba-c53d-4c7a-be48-3cbec6ebb174">
        <name>CPUUsage</name>
        <type>SystemResource</type>
        <condition>cpu usage is greater than 75%</condition>
        <action>alert</action>
        <path/>
      </test>
      <test uuid="f8eca41d-838d-4278-befe-dff825e60c2b">
        <name>LoadAvg1</name>
        <type>SystemResource</type>
        <condition>loadavg (1min) is greater than 8</condition>
        <action>alert</action>
        <path/>
      </test>
      <test uuid="7a01a55e-f36c-478c-acf0-b2b87cf92e93">
        <name>LoadAvg5</name>
        <type>SystemResource</type>
        <condition>loadavg (5min) is greater than 6</condition>
        <action>alert</action>
        <path/>
      </test>
      <test uuid="9e33516d-8a21-4bbd-8ab3-a5cb57decd01">
        <name>LoadAvg15</name>
        <type>SystemResource</type>
        <condition>loadavg (15min) is greater than 4</condition>
        <action>alert</action>
        <path/>
      </test>
      <test uuid="e758fec5-b072-4360-9f66-b04d8959b796">
        <name>SpaceUsage</name>
        <type>SpaceUsage</type>
        <condition>space usage is greater than 75%</condition>
        <action>alert</action>
        <path/>
      </test>
      <test uuid="c2e6c766-e276-4881-9de5-f6b73d4f1a97">
        <name>ChangedStatus</name>
        <type>ProgramStatus</type>
        <condition>changed status</condition>
        <action>alert</action>
        <path/>
      </test>
      <test uuid="305c51c3-9761-41bd-91fb-347d1362bb87">
        <name>NonZeroStatus</name>
        <type>ProgramStatus</type>
        <condition>status != 0</condition>
        <action>alert</action>
        <path/>
      </test>
    </monit>
    <OpenVPNExport version="0.0.1">
      <servers/>
    </OpenVPNExport>
    <OpenVPN version="1.0.1">
      <Overwrites/>
      <Instances/>
      <StaticKeys/>
    </OpenVPN>
    <Gateways version="1.0.0">
      <gateway_item uuid="f79da83d-b663-416b-8d0a-467e7bd01291">
        <disabled>0</disabled>
        <name>WAN_GW</name>
        <descr>Interface WAN Gateway</descr>
        <interface>wan</interface>
        <ipprotocol>inet</ipprotocol>
        <gateway>##WANGW##</gateway>
        <defaultgw>1</defaultgw>
        <fargw>0</fargw>
        <monitor_disable>1</monitor_disable>
        <monitor_noroute>0</monitor_noroute>
        <monitor_killstates>0</monitor_killstates>
        <monitor/>
        <force_down>0</force_down>
        <priority>255</priority>
        <weight>1</weight>
        <latencylow/>
        <latencyhigh/>
        <losslow/>
        <losshigh/>
        <interval/>
        <time_period/>
        <loss_interval/>
        <data_length/>
      </gateway_item>
    </Gateways>
    <Syslog version="1.0.2">
      <general>
        <enabled>1</enabled>
        <loglocal>1</loglocal>
        <maxpreserve>31</maxpreserve>
        <maxfilesize/>
      </general>
      <destinations/>
    </Syslog>
    <TrafficShaper version="1.0.3">
      <pipes/>
      <queues/>
      <rules/>
    </TrafficShaper>
    <trust>
      <general version="1.0.1">
        <store_intermediate_certs>0</store_intermediate_certs>
        <install_crls>0</install_crls>
        <fetch_crls>0</fetch_crls>
        <enable_legacy_sect>1</enable_legacy_sect>
        <enable_config_constraints>0</enable_config_constraints>
        <CipherString/>
        <Ciphersuites/>
        <SignatureAlgorithms/>
        <groups/>
        <MinProtocol/>
        <MinProtocol_DTLS/>
      </general>
    </trust>
    <unboundplus version="1.0.12">
      <general>
        <enabled>1</enabled>
        <port>53</port>
        <stats/>
        <active_interface/>
        <dnssec>0</dnssec>
        <dns64>0</dns64>
        <dns64prefix/>
        <noarecords>0</noarecords>
        <regdhcp>1</regdhcp>
        <regdhcpdomain/>
        <regdhcpstatic>1</regdhcpstatic>
        <noreglladdr6>0</noreglladdr6>
        <noregrecords>0</noregrecords>
        <txtsupport>0</txtsupport>
        <cacheflush>1</cacheflush>
        <local_zone_type>transparent</local_zone_type>
        <outgoing_interface/>
        <enable_wpad>0</enable_wpad>
      </general>
      <advanced>
        <hideidentity/>
        <hideversion/>
        <prefetch/>
        <prefetchkey/>
        <dnssecstripped/>
        <aggressivensec>1</aggressivensec>
        <serveexpired/>
        <serveexpiredreplyttl/>
        <serveexpiredttl/>
        <serveexpiredttlreset/>
        <serveexpiredclienttimeout/>
        <qnameminstrict/>
        <extendedstatistics/>
        <logqueries/>
        <logreplies/>
        <logtagqueryreply/>
        <logservfail/>
        <loglocalactions/>
        <logverbosity>1</logverbosity>
        <valloglevel>0</valloglevel>
        <privatedomain/>
        <privateaddress>0.0.0.0/8,10.0.0.0/8,100.64.0.0/10,169.254.0.0/16,172.16.0.0/12,192.0.2.0/24,192.168.0.0/16,198.18.0.0/15,198.51.100.0/24,203.0.113.0/24,233.252.0.0/24,::1/128,2001:db8::/32,fc00::/8,fd00::/8,fe80::/10</privateaddress>
        <insecuredomain/>
        <msgcachesize/>
        <rrsetcachesize/>
        <outgoingnumtcp/>
        <incomingnumtcp/>
        <numqueriesperthread/>
        <outgoingrange/>
        <jostletimeout/>
        <discardtimeout/>
        <cachemaxttl/>
        <cachemaxnegativettl/>
        <cacheminttl/>
        <infrahostttl/>
        <infrakeepprobing/>
        <infracachenumhosts/>
        <unwantedreplythreshold/>
      </advanced>
      <acls>
        <default_action>allow</default_action>
      </acls>
      <dnsbl>
        <enabled>0</enabled>
        <safesearch/>
        <type/>
        <lists/>
        <whitelists/>
        <blocklists/>
        <wildcards/>
        <address/>
        <nxdomain/>
      </dnsbl>
      <forwarding>
        <enabled>1</enabled>
      </forwarding>
      <dots/>
      <hosts>
      </hosts>
      <aliases/>
    </unboundplus>
    <wireguard>
      <client version="1.0.0">
        <clients/>
      </client>
      <general version="0.0.1">
        <enabled>0</enabled>
      </general>
      <server version="1.0.0">
        <servers/>
      </server>
    </wireguard>
    <QemuGuestAgent version="1.0.0">
      <general>
        <Enabled>1</Enabled>
        <LogDebug>0</LogDebug>
        <DisabledRPCs/>
      </general>
    </QemuGuestAgent>
    <AcmeClient version="4.2.0">
      <settings>
        <enabled>0</enabled>
        <autoRenewal>1</autoRenewal>
        <UpdateCron/>
        <environment/>
        <challengePort>43580</challengePort>
        <TLSchallengePort>43581</TLSchallengePort>
        <restartTimeout>600</restartTimeout>
        <haproxyIntegration>0</haproxyIntegration>
        <haproxyAclRef/>
        <haproxyActionRef/>
        <haproxyServerRef/>
        <haproxyBackendRef/>
        <logLevel>normal</logLevel>
        <showIntro>1</showIntro>
      </settings>
      <accounts/>
      <certificates/>
      <validations/>
      <actions/>
    </AcmeClient>
    <quagga>
      <bgp version="1.1.0">
        <enabled>1</enabled>
        <asnumber>65011</asnumber>
        <distance/>
        <routerid/>
        <graceful>0</graceful>
        <networkimportcheck>1</networkimportcheck>
        <logneighborchanges>0</logneighborchanges>
        <networks/>
        <neighbors>
        </neighbors>
        <aspaths/>
        <prefixlists>
        </prefixlists>
        <communitylists/>
        <routemaps>
        </routemaps>
        <peergroups/>
        <redistributions>
          <redistribution uuid="91ac2757-f0bd-40ad-b878-df3846eb4aa7">
            <enabled>1</enabled>
            <description/>
            <redistribute>connected</redistribute>
            <linkedRoutemap/>
          </redistribution>
        </redistributions>
      </bgp>
      <general version="1.0.3">
        <enabled>1</enabled>
        <profile>traditional</profile>
        <enablecarp>0</enablecarp>
        <enablesyslog>1</enablesyslog>
        <enablesnmp>0</enablesnmp>
        <sysloglevel>notifications</sysloglevel>
        <fwrules>0</fwrules>
      </general>
      <ospf version="1.1.0">
        <enabled>0</enabled>
        <carp_demote>0</carp_demote>
        <routerid/>
        <costreference/>
        <logadjacencychanges>0</logadjacencychanges>
        <originate>0</originate>
        <originatealways>0</originatealways>
        <originatemetric/>
        <passiveinterfaces/>
        <networks/>
        <interfaces/>
        <prefixlists/>
        <routemaps/>
        <redistributions/>
      </ospf>
      <ospf6 version="1.1.0">
        <enabled>0</enabled>
        <carp_demote>0</carp_demote>
        <routerid/>
        <originate>0</originate>
        <originatealways>0</originatealways>
        <originatemetric/>
        <networks/>
        <interfaces/>
        <prefixlists/>
        <routemaps/>
        <redistributions/>
      </ospf6>
      <rip version="1.0.3">
        <enabled>0</enabled>
        <version>2</version>
        <networks/>
        <passiveinterfaces/>
        <redistribute/>
        <defaultmetric/>
      </rip>
      <bfd version="1.0.1">
        <enabled>0</enabled>
        <neighbors/>
      </bfd>
      <static version="1.0.0">
        <enabled>0</enabled>
        <routes/>
      </static>
    </quagga>
  </OPNsense>
  <hasync version="1.0.2">
    <disablepreempt>0</disablepreempt>
    <disconnectppps>0</disconnectppps>
    <pfsyncinterface/>
    <pfsyncpeerip/>
    <pfsyncversion>1400</pfsyncversion>
    <synchronizetoip/>
    <verifypeer>0</verifypeer>
    <username/>
    <password/>
    <syncitems/>
  </hasync>
  <ifgroups version="1.0.0">
    <ifgroupentry uuid="af9cef65-7b40-4356-8b3a-f5725a1d038c">
      <ifname>Private</ifname>
      <members>lan,opt1,opt2,opt3</members>
      <nogroup>1</nogroup>
      <sequence>0</sequence>
      <descr>All private interfaces</descr>
    </ifgroupentry>
  </ifgroups>
  <gifs version="1.0.0">
    <gif/>
  </gifs>
  <gres version="1.0.0">
    <gre/>
  </gres>
  <laggs version="1.0.0">
    <lagg/>
  </laggs>
  <virtualip version="1.0.1">
    <vip/>
  </virtualip>
  <vlans version="1.0.0">
    <vlan uuid="cbd9c39e-3c2c-4ed4-a54c-c2435b97b888">
      <if>vtnet1</if>
      <tag>10</tag>
      <pcp>0</pcp>
      <proto/>
      <descr>USER</descr>
      <vlanif>vlan01</vlanif>
    </vlan>
    <vlan uuid="2636109d-8720-4ff7-a1be-f96334549776">
      <if>vtnet1</if>
      <tag>20</tag>
      <pcp>0</pcp>
      <proto/>
      <descr>DMZ</descr>
      <vlanif>vlan02</vlanif>
    </vlan>
    <vlan uuid="8b0d83a6-2e22-4fdd-8ecb-7f68f4fea1b9">
      <if>vtnet1</if>
      <tag>30</tag>
      <pcp>0</pcp>
      <proto/>
      <descr>GUEST</descr>
      <vlanif>vlan03</vlanif>
    </vlan>
  </vlans>
  <openvpn/>
  <staticroutes version="1.0.0">
    <route/>
  </staticroutes>
  <bridges>
    <bridged/>
  </bridges>
  <ppps>
    <ppp/>
  </ppps>
  <wireless>
    <clone/>
  </wireless>
  <ca/>
  <dhcpdv6/>
  <syslog/>
  <dnsmasq version="1.0.0">
    <enable>0</enable>
    <regdhcp>0</regdhcp>
    <regdhcpstatic>0</regdhcpstatic>
    <dhcpfirst>0</dhcpfirst>
    <strict_order>0</strict_order>
    <domain_needed>0</domain_needed>
    <no_private_reverse>0</no_private_reverse>
    <log_queries>0</log_queries>
    <no_hosts>0</no_hosts>
    <strictbind>0</strictbind>
    <dnssec>0</dnssec>
    <regdhcpdomain/>
    <interface/>
    <port/>
    <dns_forward_max/>
    <cache_size/>
    <local_ttl/>
  </dnsmasq>
</opnsense>
