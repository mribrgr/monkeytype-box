<p align="center">
  <img width=422 src="https://gist.githubusercontent.com/artemnovichkov/420ad212b0e139e3f79d5e00d1c3fa37/raw/cc6b0527b2bca010e6809eca03763ea9f2fbd33e/image.jpg">
  <h3 align="center">monkeytype-box</h3>
  <p align="center">⌨️ Update a pinned gist with Monkeytype Personal Bests</p>
  <p align="center">
    <a href="https://github.com/artemnovichkov/monkeytype-box/actions/workflows/schedule.yml">
      <img src="https://github.com/artemnovichkov/monkeytype-box/actions/workflows/schedule.yml/badge.svg">
    </a>
  </p>
</p>

## Setup

1. Create a new public [GitHub Gist](https://gist.github.com).
1. Create a [token](https://github.com/settings/tokens/new) with the `gist` scope and copy it.
3. Fork this repo
4. Go to the repo **Settings > Secrets anv variables > Actions**
5. Add the following environment variables:
   - **GH_TOKEN:** The GitHub token generated above;
   - **GIST_TOKEN**: The ID portion from your gist url: `https://gist.github.com/artemnovichkov/`**c24fd619278b272471af51f06c1ce6b2**;
   - **MONKEYTYPE_APE_KEY**: The Ape Key token from [Monkeytype](https://monkeytype.com/account-settings). 

## Author

Artem Novichkov, https://www.artemnovichkov.com/

## License

The project is available under the MIT license. See the [LICENSE](./LICENSE) file for more info.
