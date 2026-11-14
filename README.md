# PaintColorMatcher -- CIEDE2000 Architectural Paint Color & LRV Matching Engine

[![Official Website](https://img.shields.io/badge/Website-paintcolormatcher.com-blue)](https://paintcolormatcher.com)
[![Homebrew Tap](https://img.shields.io/badge/Homebrew_Tap-AbigailDavised%2Fpaintcolormatcher-orange)](https://github.com/AbigailDavised/homebrew-paintcolormatcher)
[![License: MIT](https://img.shields.io/badge/License-MIT-brightgreen.svg)](LICENSE)
[![MCP Registry](https://img.shields.io/badge/MCP_Registry-com.paintcolormatcher%2Fmcp-green)](https://paintcolormatcher.com/api/mcp)

Colorimetric command-line utility and Model Context Protocol (MCP) companion for **[paintcolormatcher.com](https://paintcolormatcher.com)**. Converts sRGB / HEX values into CIE L*a*b* coordinates (D65 illuminant, 2-degree standard observer), computes perceptual Delta E 2000 (`CIEDE2000`) distances, and cross-matches architectural coatings across Sherwin-Williams, Benjamin Moore, and Behr.

## Homebrew Installation

```bash
brew tap AbigailDavised/paintcolormatcher
brew install paintcolormatcher-cli
```

## CLI Quick Usage

```bash
# Display help and verified endpoints
paintcolormatcher-cli --help

# Output domain technical specification matrix as structured JSON
paintcolormatcher-cli --specs

# Output verified production endpoints as JSON
paintcolormatcher-cli --routes
```

---

## CIEDE2000 Perceptual Tolerance & Light Reflectance Value (LRV) Thresholds

| Metric / Band | Numerical Range | Visual & Architectural Interpretation | Recommended Sheen Pairing |
| :--- | :--- | :--- | :--- |
| Delta E 2000 <= 1.0 | 0.00 - 1.00 dE00 | Imperceptible difference to the human eye under D65 daylight | Direct cross-brand substitute |
| Delta E 2000 1.0 - 2.0 | 1.01 - 2.00 dE00 | Close commercial match; subtle undertone shift only at seam edges | Adjacent room / trim match |
| Low LRV (Dark Accent) | LRV 3% - 25% | Absorbs >= 75% of incident light; requires high-hide tinted primer | Matte / Eggshell |
| Mid LRV (Balanced Wall) | LRV 45% - 68% | Stable chroma across North-facing cool and South-facing warm rooms | Eggshell / Satin |
| High LRV (Gallery White) | LRV 75% - 94% | Reflects daylight deeply; check b* axis (> +2.5 warm cream vs < 0 crisp) | Flat Ceiling / Semi-Gloss Trim |

## Core Engineering & Domain Architecture

- **Linearized sRGB -> XYZ -> CIE L*a*b* Pipeline**: Strips gamma companding (`gamma = 2.4` above `0.04045`) prior to D65 tristimulus matrix multiplication, preventing dark-neutral hue distortion common in naive RGB Euclidean matchers.
- **CIEDE2000 (`dE00`) Perceptual Weighting**: Applies lightness (`SL`), chroma (`SC`), hue (`SH`), and blue-region rotation (`RT`) compensation terms standardized in ISO/CIE 11664-6.
- **Hosted Read-Only MCP Endpoint**: Streamable HTTP endpoint at `https://paintcolormatcher.com/api/mcp` for automated HEX-to-paint brand lookups.

## Verified Production Tools & Reference Endpoints

| Module / Resource | Canonical URL | Direct Access |
| :--- | :--- | :--- |
| **PaintColorMatcher Primary Workbench** | `https://paintcolormatcher.com/` | [Launch Workbench](https://paintcolormatcher.com/) |
| **Find Paint Color from Photo (Wall Color Identifier)** | `https://paintcolormatcher.com/find-paint-color-from-photo` | [Open Tool](https://paintcolormatcher.com/find-paint-color-from-photo) |
| **HEX to Real Paint Brand Converter (CIEDE2000)** | `https://paintcolormatcher.com/hex-to-paint-color` | [Open Tool](https://paintcolormatcher.com/hex-to-paint-color) |
| **Behr Paint Colors Catalog & Cross-Brand Equivalents** | `https://paintcolormatcher.com/behr-paint-colors` | [Open Tool](https://paintcolormatcher.com/behr-paint-colors) |
| **Sherwin-Williams Full Color Index & LRV Reference** | `https://paintcolormatcher.com/sherwin-williams-paint-colors` | [Open Tool](https://paintcolormatcher.com/sherwin-williams-paint-colors) |
| **Benjamin Moore Paint Colors, Undertones & Matches** | `https://paintcolormatcher.com/benjamin-moore-paint-colors` | [Open Tool](https://paintcolormatcher.com/benjamin-moore-paint-colors) |

## License

Released under the [MIT License](LICENSE) -- [paintcolormatcher.com](https://paintcolormatcher.com).
