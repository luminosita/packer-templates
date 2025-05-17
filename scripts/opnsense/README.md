# OPNSense Configuration

## Clone OPNSense Template

Hardware:
- Change BIOS type to SeaBIOS
- Remove EFI disk

## Assign Interfaces

Login thru Proxmox Console

Assign `vtnet0` to `WAN`
Assign `vtnet1` to `LAN`

Set IP address to `LAN` to something different than `WAN` (e.g. `192.168.100.1`)
Enable `DHCP` on `LAN`

## Generate Configuration File

Edit `config.sh` with proper values

```bash
$ bash config.sh
```

## Apply Configuration

### Access Web UI

You need a browser on a host on the same Proxmox `bridge` as `LAN` interface (`vtnet1`), which should be the second network device in VM

### Firmware

Update firmware (System > Firmware)

### Install Plugins

- os-acme-client
- os-qemu-guest-agent
- os-frr

### Apply Configuration 

System > Configuration > Backups > Restore

Load `config.xml` file created by `config.sh` script

Select `Restore configuration`



