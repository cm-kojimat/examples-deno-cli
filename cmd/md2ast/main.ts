import unified from "unified";
import gfm from "remark-gfm";
import parse from "remark-parse";

const processor = unified().use(parse).use(gfm);
const BUFFER_SIZE = 2048;

const main = async () => {
  const decoder = new TextDecoder();
  const buffers = [];
  while (true) {
    const buf = new Uint8Array(BUFFER_SIZE);
    const n = await Deno.stdin.read(buf);
    if (n === null) {
      break;
    }

    const text = decoder.decode(buf.subarray(0, n));
    buffers.push(text);

    if (n < BUFFER_SIZE) {
      break;
    }
  }

  console.log(JSON.stringify(processor.parse(buffers.join(""))));
};

main();
