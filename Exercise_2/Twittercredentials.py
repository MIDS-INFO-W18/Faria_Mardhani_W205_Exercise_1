import tweepy

consumer_key = "6dYGeAnj1GWxannPerlOZn9CQ";
#eg: consumer_key = "YisfFjiodKtojtUvW4MSEcPm";


consumer_secret = "MOpO7n8tCv2t0SIkSsUJLYinCQDvDLEY2vUgRhhYDWJnHMDde1";
#eg: consumer_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token = "2154102288-8tSlv6dZgBeS6zWzQvoxY3RaIC0YOzQ5UNNbAE7";
#eg: access_token = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token_secret = "5TazGm09cMeGVxBKmTfAOtOpfJq8WbtBSFhKYBclbwkl3";
#eg: access_token_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";


auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)



