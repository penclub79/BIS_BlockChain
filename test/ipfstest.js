var ipfsClient = require('ipfs-http-client');

var ipfs = ipfsClient('220.76.95.91', '8080', { protocol: 'http' }); // leaving out the arguments will default to these values

const content = Ipfs.Buffer.from('ABC')
const results = await ipfs.add(content)
const hash = results[0].hash // "Qm...WW"
console.log(hash);

