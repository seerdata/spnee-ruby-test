spnee-ruby-test
===============

These tests enable you to test your configuration and send in test data to our system.

#### restfile.rb

```
ruby restfile.rb -f mydata.json
```

Reads JSON data from the file mydata.json and makes a REST API call to the
endpoint

**http://localhost:4567/api/1.0/event**

```
ruby restfile.rb -h
```

To see other parameters run this command.

#### queueread.rb

```
ruby queueread.rb
```

Without any parameters it will read data JSON data from the **customer** queue and
print it out to the console.

```
ruby queueread.rb -f mydata.json
```

Read JSON data from the **customer** queue and write the JSON to the file
mydata.json
