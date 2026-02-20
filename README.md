# PKGBUILDs

A collection of custom [PKGBUILD](https://wiki.archlinux.org/title/PKGBUILD) scripts for Arch Linux ARM, maintained by [Gomasy](https://github.com/gomasy).

## Packages

| Package | Description |
|---------|-------------|
| [asterisk-lts-22](asterisk-lts-22/) | A complete PBX solution — LTS release 22 |
| [libreswan](libreswan/) | IPsec implementation with IKEv1 and IKEv2 keying protocols |
| [mackerel-agent](mackerel-agent/) | Application performance management agent by Mackerel |
| [minio-modified](minio-modified/) | Object storage server compatible with Amazon S3 |
| [neovim-mainline](neovim-mainline/) | Fork of Vim built from the latest mainline source |
| [nginx-mainline-mod-brotli](nginx-mainline-mod-brotli/) | Brotli compression module for mainline nginx |
| [nginx-mainline-mod-fancyindex](nginx-mainline-mod-fancyindex/) | Fancy directory index module for mainline nginx |
| [nginx-mainline-mod-headers-more](nginx-mainline-mod-headers-more/) | Set and clear HTTP headers module for mainline nginx |
| [openarc](openarc/) | Open source implementation of the ARC email authentication system |
| [otelcol](otelcol/) | OpenTelemetry Collector binary |
| [readsb-protobuf](readsb-protobuf/) | Mode-S/ADS-B/TIS decoder for RTLSDR and other devices |
| [tree-sitter-mainline](tree-sitter-mainline/) | Incremental parsing system for programming tools, built from mainline |
| [tree-sitter-mainline-c](tree-sitter-mainline-c/) | C grammar for tree-sitter, built against tree-sitter-mainline |
| [tree-sitter-mainline-lua](tree-sitter-mainline-lua/) | Lua grammar for tree-sitter, built against tree-sitter-mainline |
| [tree-sitter-mainline-markdown](tree-sitter-mainline-markdown/) | Markdown grammar for tree-sitter, built against tree-sitter-mainline |
| [tree-sitter-mainline-query](tree-sitter-mainline-query/) | TS query grammar for tree-sitter, built against tree-sitter-mainline |
| [tree-sitter-mainline-vim](tree-sitter-mainline-vim/) | Vimscript grammar for tree-sitter, built against tree-sitter-mainline |
| [tree-sitter-mainline-vimdoc](tree-sitter-mainline-vimdoc/) | Vim help file grammar for tree-sitter, built against tree-sitter-mainline |
| [vim-mainline](vim-mainline/) | Vi IMproved, built from the latest mainline source |

## Building

Each package can be built with [makepkg](https://wiki.archlinux.org/title/Makepkg):

```sh
cd <package-name>
makepkg -si
```

Alternatively, a `Dockerfile` is provided for building packages in an isolated Arch Linux ARM environment:

```sh
docker build --build-context <package-name> .
```

## License

MIT — see [LICENSE](LICENSE) for details.
