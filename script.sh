VERSION_TAG=$(curl \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/ScratchAddons/ScratchAddons/releases \
  | jq -r '.[0].tag_name')

wget \
  -O scratchaddons-$VERSION_TAG.crx \
  -U "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4230.1 Safari/537.36" \
  "https://clients2.google.com/service/update2/crx?response=redirect&prodversion=86.0.4230.1&acceptformat=crx2,crx3&x=id%3Dfbeffbjdlemaoicjdapfpikkikjoneco%26uc"

wget \
  -O scratchaddons-$VERSION_TAG.xpi \
  https://addons.mozilla.org/firefox/downloads/latest/scratch-messaging-extension/addon-12999334-latest.xpi