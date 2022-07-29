import { SampleObject } from 'sample.js';

import { verifyEnvVars } from './utils/util.js';

verifyEnvVars();

function message() {
  const obj: SampleObject = {
    message: 'Hello World!',
    show: true
  }

  if (obj.show)
    console.log(obj);
}


message();