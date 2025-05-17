# OPNSense Configuration

Clone OPNSense Template and inspect `Hardware` section

## Assign Interfaces

Login thru Proxmox Console

Assign `vtnet0` to `WAN`
Assign `vtnet1` to `LAN`

Set IP address to `LAN` to something different than `WAN` (e.g. `192.168.100.1`)
Enable `DHCP` on `LAN`

## Generate Configuration File

Edit `scripts/config.sh` with proper values

```bash
$ bash scripts/config.sh
```

## Apply Configuration

### Access Web UI

You need a browser with IP coming from OPNSense `LAN` DHCP server (e.g. Proxmox VM on the same `bridge` as `LAN` interface `vtnet1`, which should be the second network device in VM)

### Firmware

Update firmware (System > Firmware)

### Install Plugins

- os-acme-client
- os-qemu-guest-agent
- os-frr

### Apply Configuration 

System > Configuration > Backups > Restore

Load `config.xml` file created by `scripts/config.sh` script

Select `Restore configuration`



