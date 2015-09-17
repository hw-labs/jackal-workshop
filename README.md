# Simple Jackal Workshop

## Setup

Clone repository:

```
> git clone https://github.com/hw-labs/jackal-workshop
```

Change to new directory:

```
> cd jackal-workshop
```

Install the bundle:

```
> bundle install
```

Run the jackal:

```
> bundle exec jackal -c config.rb
```

\o/

## Usage

### Initial

Jackal will be listening on port `9999`. Lets make that accessible:

```
> ngrok 9999
```

Copy address and add to GitHub webhook:

```
https://STUFF.ngrok.com/github
```

And push something to repo.

### Do something

#### Create Endpoint

Create a requestbin: http://requestb.in

#### Update config

Open the `custom.rb` file and update the
`ENDPOINT_VALUE` with the new requestbin
value.

#### Restart Jackal

```
> jackal -c custom.rb
```

Push commit see output, refresh requestbin.
