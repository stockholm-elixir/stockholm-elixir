[![Circle CI](https://circleci.com/gh/stockholm-elixir/stockholm-elixir.png?style=badge)](https://circleci.com/gh/stockholm-elixir/stockholm-elixir)

# Stockholm Elixir

This is the official Stockholm Elixir homepage repo.


## Development

    mix deps.get
    mix phoenix.server


## Test

    mix deps.get
    mix test


## Production

This app is deployed to <http://stockholm-elixir.herokuapp.com/>.

Deploy:

    git push heroku master

One-time setup (already done):

    heroku apps:create stockholm-elixir --buildpack https://github.com/HashNuke/heroku-buildpack-elixir.git
    heroku config:set MIX_ENV=prod
    heroku config:set SECRET_KEY_BASE=$(elixir -e "IO.puts :crypto.strong_rand_bytes(64) |> Base.encode64")


## Contributors

* [Henrik Nyh](https://github.com/henrik)
* [Joakim Kolsjö](https://github.com/joakimk)
* [Karl Eklund](https://github.com/kek)
* [Kristoffer Roupé](https://github.com/kitofr)
* [Lennart Fridén](https://github.com/DevL)
* [Martin Svalin](https://github.com/martinsvalin)
* [Mikael Amborn](https://github.com/MikaelAmborn)
* [Tomas Skogberg](https://github.com/tskogberg)
* [Victoria Wagman](https://github.com/littlekid)


## License

MIT license.

>  Copyright © 2014 Stockholm Elixir
>
>  Permission is hereby granted, free of charge, to any person obtaining a copy
>  of this software and associated documentation files (the "Software"), to deal
>  in the Software without restriction, including without limitation the rights
>  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
>  copies of the Software, and to permit persons to whom the Software is
>  furnished to do so, subject to the following conditions:
>
>  The above copyright notice and this permission notice shall be included in
>  all copies or substantial portions of the Software.
>
>  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
>  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
>  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
>  THE SOFTWARE.
