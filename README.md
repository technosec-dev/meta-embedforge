# meta-embedforge

EmbedForge distribution layer for the Yocto Project / OpenEmbedded build system.

## Overview

This layer provides the `embedforge` distribution configuration — a minimal, systemd-based distro for embedded Linux builds. It replaces the Poky reference distribution with sensible defaults optimized for production use.

## Features

- **Minimal by default**: Only essential distro features enabled (systemd, IPv4/6, security hardening)
- **systemd init**: No sysvinit — modern init system with service management
- **Security hardened**: Stack protector, FORTIFY_SOURCE enabled by default
- **Reproducible builds**: `BUILD_REPRODUCIBLE_BINARIES` enabled
- **No Poky dependency**: Inherits from OE-Core's `defaultsetup.conf` directly
- **No GUI**: Headless by default — templates add graphics features as needed

## Compatibility

- Kirkstone (4.0 LTS)
- Scarthgap (5.0 LTS)
- Whinlatter (5.3)
- Wrynose (6.0 LTS)

## Dependencies

- `openembedded-core` (`meta` layer) — the only required dependency

## Usage

Add this layer to your `bblayers.conf`:

```
BBLAYERS += "/path/to/meta-embedforge"
```

Set the distro in `local.conf`:

```
DISTRO = "embedforge"
```

## Customization

Templates can override any setting via `local.conf`. Common overrides:

```bash
# Add WiFi/Bluetooth support
DISTRO_FEATURES:append = " wifi bluetooth"

# Add graphics support
DISTRO_FEATURES:append = " opengl wayland"

# Add container support (requires meta-container-deploy + meta-virtualization)
DISTRO_FEATURES:append = " virtualization"
```

## License

MIT
