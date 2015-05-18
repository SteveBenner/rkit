# RubyKit
This is my personal collection of libraries and extensions for enhancing Ruby development.

### Structure / Organization
This repo is structured based on patterns and conventions found in the [RubyGems guide][1].

- Like a gem, the `lib` directory should be added to Ruby's `$LOAD_PATH`.
- All of my original code is segregated to the `lib/rkit` directory. The remaining contents of `lib/` are either derivative works or third-party creations.
- For convenience, many directories are accompanied by a Ruby script of the same name that will load all children files when `require`'d.

#### Usage
I add the path to `lib/` within this repo to the `RUBYLIB` Environment Variable, which provide system-wide access to the code within. `RUBYLIB` is utilized exactly like the `PATH` variable; that is, any contained paths are automatically appended to the global `$LOAD_PATH` in Ruby interpreters.

## License
As previously mentioned, contents of this repository are divided into two categories:

- All files within `lib/rkit/` are copyrighted to myself, under [the GPLv3 license][2].
- The rest of it may be considered unlicensed, unless otherwise stated within individual file.

---
**DISCLAIMER:** Files in this repository may contain code taken from online sources for which I claim neither ownership nor authorship. I will do my best to attribute credit where due, and to supply and adhere to any relevant licenses for such code. If detected, please report improper licensing or usage of any material within this repository via Github issue.

[1]: http://guides.rubygems.org/patterns/#loading-code
[2]: lib/rkit/LICENSE.md