process.stdin.setEncoding('utf8');

process.stdin.on('readable', () => {
  const name = process.stdin.read();
  if (name !== null) {
    process.stdout.write(`Witaj ${name}`);
    process.exit();
  }
});

