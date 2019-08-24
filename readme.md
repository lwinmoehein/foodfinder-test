# Food Finder Backend API Documentaion
## The first step, Your computer export sql file
### Step 1 (Get client token)
```language
request url: http://localhost:8000/oauth/token
Method : POST
Body{
grant_type:client_credentials
client_id:3
client_secret:z3o6VRIInSgOMrVdwUfL7jUAsUNHztAFgHr2stcm
scope:
}
Headers{
    Accept:application/json
}
```
#### Response client access token
```language
{
    "token_type": "Bearer",
    "expires_in": 31622399,
    "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjJjZDI2NTkzZjFhNWEyZjVkNDIxOGI5NDE0NmM3NGU0ZDViOGU4MGE4ZWE2MzViOTM5NzZlNjJkNDFkNzI2ODFiZGZhODIxZmIyNTRlMGEzIn0.eyJhdWQiOiIzIiwianRpIjoiMmNkMjY1OTNmMWE1YTJmNWQ0MjE4Yjk0MTQ2Yzc0ZTRkNWI4ZTgwYThlYTYzNWI5Mzk3NmU2MmQ0MWQ3MjY4MWJkZmE4MjFmYjI1NGUwYTMiLCJpYXQiOjE1NjYxNDMxNjYsIm5iZiI6MTU2NjE0MzE2NiwiZXhwIjoxNTk3NzY1NTY1LCJzdWIiOiIiLCJzY29wZXMiOltdfQ.m4JuwT7hh5LeiQZEqtlI8CkLSjjiSQGayGeHeWYmPVB3DuRVa019Ho2OqUa7smTekfIxB3mBQXV89JSspZHeO6vUIpp3WKeGynsCE-G1_mCKNd-_XdIf6DwI8gWfeg4I2nuEPfeiRPg2sestaz06YWZmO-dwTBdhA8iKN0sPpkQm3yPDtZkPYFFN8Qoxu97Y6O2dgiesFbRs-HMa2__rPG4ZGAc3ZMAAPIwD0FbwTrfKRg01hjaNP5Sy1IQsot-TyzQ-aZkT_Ihuta1Ywy3SCkT1plgSkdYiGd9KMpaN0tmBP5QlCDNjbC8UZSkbs4VHY2bByCqMD9_xFRV0jkTI5Pz7B1z6O4dKFNP5y1PRKT47YVlaTnyhS1JAlrUE9K2irj1nGtndqXucQoZMFxGULM0qejbGc_MkJBiTLxeEQtK2kx3I1NgStKweC6fsEe9DKyXFWwF7OR7av4II0Uk9IRE883MOcxaeMOTIRxWOhrtnXbO_aUb3YS4onae2und_FzwwtSwleQkN6BVWFRiLuPg3QiLLbo2yiTSlL3KdMk3GQk8Z2xMkHFcENrfYn4TYrjdeHh6yJk2FGdnlaLrMMRWxaMc0Zd4beeRvtpIzvQt3sK2m-nOFHktncav451-mNvZccFQKXwwOVupQ1YqlRYcTAejjkrvCKTlbzv45gV0"
}

```

## Step 2 (You have access_token)
### Request followin API

[Customer API](doc/customerapidoc.md)