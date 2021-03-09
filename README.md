# README

Heroku Link
https://proyecto-twitter-jorgesifontes.herokuapp.com/

This project has a seed that generates:
- 10 users
- 100 tweets
- 50 of them includes RT
- 200 likes
- 40 relations of followers
- 1 admin account

To use any user account created do: i.e. user: Jorge ->
 email   : jorge@mail.com   
 password: 123456

To use the admin account Add ~/admin to the root url
email   : admin@example.com
password: password

Once you login or sign-in the app only shows tweets of users followed by the current user
You can hit Like or RT
The current user tweets will not be showed (because Hito-2 Requirements)
To see all the tweets you must Log-out

The search feature will use the current tweet list.
i.e. if you are logged, then it will only shows the tweets of users followed by you
that complies with the searching params.

The best way to visualize the hashtag and normal search features its by trying it 
as a visit (because Hito-2 limitations)

API Features (Hito-3)
To receive a the last 50 tweets in JSON format
* Add ~/api/news to the root url
* Do a GET request

To receive the tweets between 2 dates in JSON format
* Add ~/api/date1/date2 to the root url 
  (date1 & date2 are just for ilustration, you must ingress a date in dd-mm-yyyy format)
* Do a GET request

To create a Tweet (Tested with Postman)
* Add ~/tweets.json to the root url
* At Authorization tab, select Basic Auth and fill the Username Password fields to define the author of the tweet
* At the Body tab write a hash with only the content. Please refer to the following format
    i.e.:
    {
        "tweet": {
            "content": "#Postman direct post"
        }
    }
* Do a POST request
