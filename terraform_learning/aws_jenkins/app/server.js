const express = require('express');
const path = require('path');
const fs = require('fs');
const { MongoClient } = require('mongodb');
const bodyParser = require('body-parser');

const app = express();

app
  .use(bodyParser.urlencoded({
    extended: true
  }))
  .use(bodyParser.json());

app
  .get('/', (req, res) => {
      res.sendFile(path.join(__dirname, "index.html"));
    })
  .get('/profile-picture', (req, res) => {
    let img = fs.readFileSync(path.join(__dirname, "images/profile-1.jpg"));
    res.writeHead(200, {'Content-Type': 'image/jpg' });
    res.end(img, 'binary');
  });

// use when starting application locally with node command
let mongoUrlLocal = "mongodb://admin:password@localhost:27017";

// use when starting application as a separate docker container
let mongoUrlDocker = "mongodb://admin:password@host.docker.internal:27017";

// use when starting application as docker container, part of docker-compose
let mongoUrlDockerCompose = "mongodb://admin:password@mongodb";

// pass these options to mongo client connect request to avoid DeprecationWarning for current Server Discovery and Monitoring engine
let mongoClientOptions = { useNewUrlParser: true, useUnifiedTopology: true };

// "user-account" in demo with docker. "my-db" in demo with docker-compose
let databaseName = "my-db";

app.post('/update-profile', (req, res) => {
  const userObj = req.body;

  MongoClient.connect(mongoUrlDockerCompose, mongoClientOptions, (err, client) => {
    if (err) throw err;

    const db = client.db(databaseName);
    userObj.userid = 1;

    const myquery = { userid: 1 };
    const newvalues = { $set: userObj };

    db.collection('users')
      .updateOne(myquery, newvalues, {upsert: true}, (err, res) => {
        if (err) throw err;
        client.close();
      });

  });
  // Send response
  res.send(userObj);
});

app.get('/get-profile', (req, res) => {
  // Connect to the db
  MongoClient.connect(mongoUrlDockerCompose, mongoClientOptions, (err, client) => {
    if (err) throw err;

    const db = client.db(databaseName);

    const myquery = { userid: 1 };

    db.collection('users')
      .findOne(myquery, (err, result) => {
        if (err) throw err;

        client.close();

        // Send response
        res.send(result ? result : {});
      });
  });
});

app.listen(3000, () => {
  console.log("app listening on port 3000!");
});
