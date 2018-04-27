const logEnvTest = options => ({
  ...options,
  tester: 'Hi!',
});

const options = logEnvTest({ one: '1', two: '2' });

console.log(options);
