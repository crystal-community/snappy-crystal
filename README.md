# snappy
[![Build Status](https://travis-ci.org/benoist/snappy-crystal.svg)](https://travis-ci.org/benoist/snappy-crystal)

Snappy bindings for Crystal

## Installation


Add this to your application's `shard.yml`:

```yaml
dependencies:
  snappy:
    github: benoist/snappy-crystal
```


## Usage


```crystal
require "snappy"

deflated = Snappy.deflate("something".to_slice)
inflated = Snappy.inflate(deflated)
```

## Contributing

1. Fork it ( https://github.com/[your-github-name]/snappy/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [Benoist](https://github.com/benoist) Benoist Claassen - creator, maintainer
