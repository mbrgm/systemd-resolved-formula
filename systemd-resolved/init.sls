systemd-resolved:
  service.running:
    - enable: true
    - require:
      - file: /etc/systemd/resolved.conf

/etc/resolv.conf:
  file.symlink:
    - target: /run/systemd/resolve/resolv.conf
    - force: true
    - reqire:
      - service: systemd-resolved

/etc/systemd/resolved.conf:
  file.managed:
    - source: salt://systemd-resolved/config/resolved.conf
    - user: root
    - group: root
    - mode: 644
    - watch_in:
      - service: systemd-resolved
