const client = require('./clientCFG');

client.connect();

// client.query('SELECT * FROM person_first')
//   .then(res => console.log(res.rows))
//   .catch(e => console.error(e.stack));

// client.query('SELECT * FROM person_second')
//   .then(res => console.log(res.rows))
//   .catch(e => console.error(e.stack));

/* 2 returning */

// client.query("INSERT INTO person_second VALUES ('KARL', 'BER', 12, 178 ) RETURNING id")
//   .then(res => console.log(JSON.stringify(res.rows[0]["id"])))
//   .catch(e => console.error(e));

// client.query("INSERT INTO person_first VALUES ('John', 'Cenb', 30, 176, nextval('serial')) RETURNING id")
//   .then(res => console.log(JSON.stringify(res.rows[0]["id"])))
//   .catch(e => console.err(e)); 

/* 3 delete */

client.query('SELECT * FROM person_second')
  .then(res => console.log(res.rows))
  .catch(e => console.error(e.stack));

// client.query('DELETE FROM person_second')
//   .then(res => console.log(res.rows))
//   .catch(e => console.error(e));

// client.query('SELECT * FROM person_second')
//   .then(res => console.log(res.rows))
//   .catch(e => console.error(e.stack));

/* 3 update */
client.query("UPDATE PERSON_SECOND SET name = 'Jan' WHERE name = 'John'")
  .catch(e => console.error(e));

client.query('SELECT * FROM person_second')
  .then(res => console.log(res.rows))
  .catch(e => console.error(e.stack));

// client.query('CREATE SEQUENCE uni START 1;')
//   .catch(e => console.error(e.stack));

// client.query("INSERT INTO person_first VALUES ('AAA', 'BBB', 25, 176, nextval('serial'))")
//   .then(res => console.log(res.rows))
//   .catch(e => console.error(e));

// client.query("INSERT INTO person_second VALUES ('CCC', 'DDD', 25, 176)")
//   .then(res => console.log(res.rows))
//   .catch(e => console.error(e));

setTimeout(e => client.end(), 500);