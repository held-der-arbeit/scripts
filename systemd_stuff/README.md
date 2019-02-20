# systemd stuff

Steps needed to activate defined systemd service and timer:

```bash
systemctl enable <MY-DEFINED>.timer
systemctl enable <MY-DEFINED>.service
systemctl daemon-reload
```

Verify if the change is applied:

```bash
systemctl list-timers --all
```
