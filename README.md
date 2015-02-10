# RubyKit
This is my personal collection of libraries and extensions for enhancing Ruby development.

### Structure / Organization
This repo is structured based on patterns and conventions found in the [RubyGems guide][1].

- The `lib/` directory should be made available to Ruby's `$LOAD_PATH`.
- The `Rkit` library contains all of my original code, and is loaded by requiring the file `lib/rkit.rb`
- For convenience, entire directories can be loaded by requiring the Ruby file of the same name.

#### Usage
I use the `RUBYLIB` Environment Variable to provide system-wide access to the libraries in this repository. `RUBYLIB` functions exactly like the `PATH` variable; any contained paths are automatically appended to the global `$LOAD_PATH` in Ruby interpreters.

## License
Contents of this repository are divided into two types of licensing:

- `Rkit` is freely provided via [the GPLv3 license][2], and consists of the contents of `lib/rkit/`.
- All other source code may be considered unlicensed, unless otherwise stated in the file

---
**DISCLAIMER:** Files in this repository may contain code taken from online sources for which I claim neither ownership nor authorship. I will do my best to attribute credit where due, and to supply and adhere to any relevant licenses for such code. If detected, please report improper licensing or usage of any material within this repository by creating an issue.

[1]: (http://guides.rubygems.org/patterns/#loading-code)
[2]: lib/rkit/LICENSE.md