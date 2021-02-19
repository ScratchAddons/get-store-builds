const axios = require("axios").default
const path = require("path")
const fs = require("fs-extra")

axios.get("https://clients2.google.com/service/update2/crx?response=redirect&prodversion=86.0.4230.1&acceptformat=crx2,crx3&x=id%3Dfbeffbjdlemaoicjdapfpikkikjoneco%26uc", {
	headers: {
		"User-Agent": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4230.1 Safari/537.36"
	},
	responseType: "stream"
}).then(response => {
	const version = /extension_(\d+)_(\d+)_(\d+)_(\d+)\.crx/.exec(path.basename(response.request.path)).slice(1, 4)
	const writer = fs.createWriteStream(`scratchaddons-v${version.join(".")}.crx`)
	response.data.pipe(writer)
	console.log(`Wrote scratchaddons-v${version.join(".")}.crx`)
})

axios.get("https://addons.mozilla.org/firefox/downloads/latest/scratch-messaging-extension/addon-12999334-latest.xpi", {
	responseType: "stream"
}).then(response => {
	const version = /scratch_addons-(\d+)\.(\d+)\.(\d+)-an\+fx\.xpi/.exec(path.basename(response.request.path)).slice(1, 4)
	const writer = fs.createWriteStream(`scratchaddons-v${version.join(".")}.xpi`)
	response.data.pipe(writer)
	console.log(`Wrote scratchaddons-v${version.join(".")}.xpi`)
})



