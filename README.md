# RubyKit
My personal collection of Ruby libraries and extensions used for enhancing Ruby development

## Structure / Organization
This repository is structured based on patterns of the [RubyGems guide](http://guides.rubygems.org/patterns/#loading-code).

- The `lib/` directory should be made available to Ruby's `$LOAD_PATH`.
- The `lib/rkit/` directory contains all of the code I personally authored, and only code I have authored.
- For convenience, Ruby files that have corresponding subdirectories in `lib/` will in turn load all of the Ruby files that are children of that subdirectory. Take the contents of `lib/core_ext.rb` as an example:

    ```ruby
    Dir.glob('core_ext/*.rb').each { |f| load f }
    ```
    
    In **`rkit.rb`**, the same functionality is provided via the method `Kernel#load_all`.


## Usage
I use the environment variable `RUBYLIB` to provide system-wide access to the libraries in this repository. `RUBYLIB` functions exactly like the `PATH` variable, and contained paths are appended to the Ruby global variable `$LOAD_PATH` automatically.

## License / Copyright
~~The [included license](lib/rkit/LICENSE) is only applicable to the contents of the `lib/rkit/` directory within this repository.~~

I am currently evaluating the appropriate legal requirements for the content of this repository. Until further notice, the [included license](lib/rkit/LICENSE) shall be considered applicable to the contents of the `lib/rkit/` directory.

---
**DISCLAIMER:** Scripts in this repository may contain code taken from online sources, for which I claim neither ownership nor authorship. I will do my best to attribute credit to the original authors, and to supply and adhere to all appropriate licenses. I utilize these scripts and the GitHub service with the understanding that I am not violating any law in doing so. If any legal concern were to arise regarding my use of these scripts or the GitHub service, please contact me immediately, and I will enact any and all measures necessary to rectify the situation.
