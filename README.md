<img src="logo.png" alt="yj" width="180" />

[![GoDoc](https://pkg.go.dev/badge/github.com/rplessl/yjtest/v5?status.svg)](https://pkg.go.dev/github.com/rplessl/yjtest/v5)
[![Tests](https://github.com/rplessl/yjtest/actions/workflows/go.yml/badge.svg)](https://github.com/rplessl/yjtest/actions/workflows/go.yml)

[![Packaging status](https://repology.org/badge/tiny-repos/yj-sclevine.svg)](https://repology.org/project/yj-sclevine/versions)

##

Convert between YAML, TOML, JSON, and HCL.

Preserves map order.

Format versions:
- YAML: **v3.0.1** (gopkg.in/yaml.v3)
- TOML: **v1.3.2** (github.com/BurntSushi/toml)
- JSON: **RFC 7159** (encoding/json)
- HCL: **v1.0.0** (github.com/hashicorp/hcl)

```
$ yj -h
Usage: yj [-][ytjcrneikhv]

Convert between YAML, TOML, JSON, and HCL.
Preserves map order.

-x[x]  Convert using stdin. Valid options:
          -yj, -y = YAML to JSON (default)
          -yy     = YAML to YAML
          -yt     = YAML to TOML
          -yc     = YAML to HCL
          -tj, -t = TOML to JSON
          -ty     = TOML to YAML
          -tt     = TOML to TOML
          -tc     = TOML to HCL
          -jj     = JSON to JSON
          -jy, -r = JSON to YAML
          -jt     = JSON to TOML
          -jc     = JSON to HCL
          -cy     = HCL to YAML
          -ct     = HCL to TOML
          -cj, -c = HCL to JSON
          -cc     = HCL to HCL
-n     Do not covert inf, -inf, and NaN to/from strings (YAML or TOML only)
-e     Escape HTML (JSON out only)
-i     Indent output (JSON or TOML out only)
-k     Attempt to parse keys as objects or numeric types (YAML out only)
-h     Show this help message
-v     Show version
```

## Installation

### Manual

Binaries for macOS, Linux, and Windows are [attached to each release](https://github.com/rplessl/yjtest/releases).

### Docker

`yj` is also available as a [Docker image](https://hub.docker.com/r/rplessl/yjtest).

## Go Package

Packages contained in this repo may also be used to convert all supported data formats to a normalized tree of ordered Go objects.

See [godoc](https://pkg.go.dev/github.com/rplessl/yjtest) for details.

NOTE: The current Go API should not be considered stable.

### Homebrew (version from sclevine/yj)

The `yj` CLI is available via [Homebrew](https://brew.sh):

```bash
brew install yj
```
