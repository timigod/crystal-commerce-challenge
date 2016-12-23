# Documentation

## Preamble/Notes
- Unfortunately, Marcelo Ribeiro wasn't CCed in the email, so I couldn't make this private and invite him only.
- As you'll see below, I created 3 endpoints as opposed to the requested 2 because I didn't know which sideloading format would be preferable.
- I've hosted this application at http://crystal-commerce-challenge.herokuapp.com/. This means that all endpoints can be tested using that as a base url. I have already run `rake db:seed` on the heroku application.


## Endpoints

### `/customers.json`

This returns `Customers` in an array with the associations nested as requested

```
{
  "customers": [
    {
      "first_name": "Quincy",
      "last_name": "O'Conner",
      "email": "lloyd@jacobs.info",
      "addresses": [
        {
          "street_address": "274 Ollie Ford",
          "city": {
            "name": "North Francesca",
            "state": {
              "name": "Utah"
            }
          }
        },
        {..},
        {..}
      ]
    },
    {
      "first_name": "Brayan",
      "last_name": "Carter",
      "email": "rozella@bartell.name",
      "addresses": [
        { 
        ...
```

### `customers/sideloaded.json`

This will return an array of `Customer`s with associations sideloaded within each `Customer` element.

```
{
  "customers": [
    {
      "id": "585d96407e6bf300040b8c4a",
      "first_name": "Quincy",
      "last_name": "O'Conner",
      "email": "lloyd@jacobs.info",
      "links": {
        "addresses": [
          "585d96407e6bf300040b8c4b",
          "585d96407e6bf300040b8c4c",
          "585d96407e6bf300040b8c4d",
          "585d96407e6bf300040b8c4e",
          "585d96407e6bf300040b8c4f"
        ],
        "cities": [
          "585d96407e6bf300040b8c3d",
          ...
        ],
        "states": [...]
      },
      "linked": {
        "addresses": [
          {
            "id": "585d96407e6bf300040b8c4b",
            "street_address": "274 Ollie Ford",
            "customer_id": "585d96407e6bf300040b8c4a",
            "city_id": "585d96407e6bf300040b8c3d"
          },
          {...}
        ],
        "cities": [
          {
            "id": "585d96407e6bf300040b8c3d",
            "name": "North Francesca",
            "state_id": "585d96407e6bf300040b8c21"
          }
          ...
```
### `customers/sideloaded/alternate.json`

This returns an array of `Customers` and a sideloaded seperate array of associations.

```
{
	"customers": [...],
	"associations":{
		"addresses":[...],
		"cities":[...],
		"states":[...]
	}
}
```

