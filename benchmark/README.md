This isn't a fantastic benchmark, but illustrates why you might want to cache the gems locally.

Given this [Gemfile](Gemfile), below are the differences in output when running the following:

```
gem uninstall --all --executables --force && gem install bundler && time bundle
```

```
# rubygems.org as the source
real 0m39.000s
user 0m7.550s
sys 0m1.331s

# gem-in-a-box container directly as the source and using thin

real 0m14.119s
user 0m6.549s
sys 0m1.329s

# gem-in-a-box-nginx container with proxy caching turned on

real 0m8.383s
user 0m6.767s
sys 0m1.329s
```
