#### Customer Request Register API
```language
request url: http://localhost:8000/api/customer/register
Method:POST
Header {
    Accept:application/json
    Authorization:Bearer $clientAccessToken
}
Body {
   name:Ko Myo Htun
    password:77777777
    c_password:77777777
    phone_no:09222111334
    profile_url:http://www.facebook.com/jfkdsj
}

```
#### Customer Response Register API
```language
{
    "success": {
        "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImJhNzJkYjUwNzEzN2NhZDZhNDM1Y2FjMzI0MTEwNGQxNTM5MWJjNTczYzY0ZWUyODkyYzRjZmZkNjVlYmYxMmE4ZWRjM2IzNTk5Mjk3NDMzIn0.eyJhdWQiOiIxIiwianRpIjoiYmE3MmRiNTA3MTM3Y2FkNmE0MzVjYWMzMjQxMTA0ZDE1MzkxYmM1NzNjNjRlZTI4OTJjNGNmZmQ2NWViZjEyYThlZGMzYjM1OTkyOTc0MzMiLCJpYXQiOjE1NjY0ODA0OTAsIm5iZiI6MTU2NjQ4MDQ5MCwiZXhwIjoxNTk4MTAyODkwLCJzdWIiOiI3Iiwic2NvcGVzIjpbXX0.XlfbrptQdRaBE1R_5GqPnw6EEDywKazhx5NiCL3Jogk8s9ZJdMk6bWFjP9No2-Zvhk0gcH6xI6u9tC1hajnoCwHHwA7wbWO-sEcXQyjhkb07d0EGzdh8Aws11HaV2da7jZY0N1jPmkIpcfOIuoNWWV5jmUTltZE5W5CIlXJlWm8lmyK8vp7i78eUkqXA3G83Z_lBsYo08lv0YEHuqnxPr5BPAtZI0KwWscCrwO6HXhy4s4UmQr2aaU8zq9HYgPT2QfNndPeJq8mykL7J_f8StO4-RrHOpUwvDAO0RRnL6p_lQD-iQVbxlg3S1w0cTA6JT8GZMsjUKYurpL7iX-nMbIJLnO0rBZI7lNPu7MBtumxjmVgDVSaeivV8HRf1Peo2YUrPQITD8ZU8emKrLof7hdby4cHshs0119HYUZV2xdGncRdYfIY96XzMS9GJfgJKJSD3aZGxgX56ReXTnt-EoJSpK5Czgey01DenN9zjW5piIAL3bvU6uEzztU5gwTLzBJY4LbVg11P3kCK5_sKGW_-CXMS2fmPXofJPNYgslHyA9AHWPSLK3Sk9BM5-fZEClK1T8MDG0vBVwKolnmjS-s6Gz3eMNrBLMR9gngEIvq0h6dMaIpwKS8tD0RJ5YU_W5Rm0ASROcoxYTgmrg-RbspLJJpHB0CtbuFdncX8a-8E",
        "customer": {
            "name": "Ko Myo Htun",
            "profile_url": "http://www.facebook.com/jfkdsj",
            "phone_no": "09222111334",
            "updated_at": "2019-08-22 13:28:10",
            "created_at": "2019-08-22 13:28:10",
            "id": 7
        }
    }
}
```
#### Customer Request Login API
```language
request url: http://localhost:8000/api/customer/login
Method:POST
Header {
    Accept:application/json
    Authorization:Bearer $clientAccessToken
}
Body {
   password:77777777
    phone_no:09222111334
}

```
#### Customer Response Login API
```
{
    "success": {
        "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjJkMmJlYjE3N2RhMzdjZmU0M2NlMzA5YTkwNzEzZDIyYThjNDI2MDBlNzYyZTZhYmJhZTliOWQxOTZlMGExZWU5ZTU3ZjI0YWJmYWY4NzZjIn0.eyJhdWQiOiIxIiwianRpIjoiMmQyYmViMTc3ZGEzN2NmZTQzY2UzMDlhOTA3MTNkMjJhOGM0MjYwMGU3NjJlNmFiYmFlOWI5ZDE5NmUwYTFlZTllNTdmMjRhYmZhZjg3NmMiLCJpYXQiOjE1NjY0ODA4MTIsIm5iZiI6MTU2NjQ4MDgxMiwiZXhwIjoxNTk4MTAzMjEyLCJzdWIiOiI3Iiwic2NvcGVzIjpbXX0.UedX9Jl2TxICpLZlC3aldXnUZTz9msRI1pJnYiuwqia1wDQikoFQK1_hpIEmtEs2Gw0Etv1CmBbcLHBNE41lsWb-GIKjv4Uh2i27UBb5l3dL_nvrAkOVGRPb9wPv0KKZUckjht_xo85RcdrebEfYPl44DvKana0sT5gSs9BU7Dj7ZESGMBanpb-p_-LE9kWfpPoJMrRdzKw9yEt9gSusoD36gdBCdFmutTebBgmJErXmb_1SDT04jmJzarfgEA8ve1C6aJzKZZ8579WwnInhJ2du9Q8Nqo5zc4m7c68NlqCLChuyz9lGOZaqcVKNeAyd4VnVxVyr6LlVcc2Xgb3MM75Toqniy04ot9OEffpIdLFounyq8BOFDEYwwvXX9Q-ckvp_4JKxOFXFEnwmcIHInJFti1roB5oDaxNjms3kuqauPGX5VOdh-4g-YdxgFMv5bW3MHJtD_t-abi2Qcc2aLpHs_zLeP9G11iB-6v-6z_XC0dHnjdaRhP09lT1qR_um16ueJVp4cUJZEzmNZo9VJzUwnl90t5_EbH28AN3Tgw-HPtPwlmy0Ztne9B5YyaggIDmC3deYmqACgrXEXyZDWaW9yLWcjBud3eVIqFbRXnB-VvVOsmEGlWGnKKYcStGHbbqAljIhjnXo2G9D6h9b3phy3H4QYkAN8ECQjz4QiNI"
    },
    "customer": {
        "id": 7,
        "name": "Ko Myo Htun",
        "phone_no": "09222111334",
        "profile_url": "http://www.facebook.com/jfkdsj",
        "created_at": "2019-08-22 13:28:10",
        "updated_at": "2019-08-22 13:28:10"
    }
}

```
#### Customer info Request API
```language
request url: http://localhost:8000/api/customer/details
Method:POST
Header {
    Accept:application/json
    Authorization:Bearer $customerAccessToken
}
```
#### Customer info Resopnse API
```language
{
    "success": {
        "id": 5,
        "name": "Ko Phyo",
        "phone_no": "09111222333",
        "profile_url": "http://www.facebook.com/jfkdsj",
        "created_at": "2019-08-22 13:18:52",
        "updated_at": "2019-08-22 13:18:52"
    }
}
```
#### Customer infoupdate Request API
```language
request url: http://localhost:8000/api/customer/infoupdate
Method: PUT
Header {
    Accept:application/json
    Authorization:Bearer .$customerAccessToken
    Content-Type:application/x-www-form-urlencoded
}
Body{
    name:Aung Aung
    profile_url:http://www.facebook.com/fjsdkijf
}
```
#### Customer infoupdate Response API
```language
{
    "data": {
        "customer": {
            "id": 5,
            "name": "Aung Aung",
            "phone_no": "09111222333",
            "profile_url": "http://www.facebook.com/fjsdkijf",
            "created_at": "2019-08-22 13:18:52",
            "updated_at": "2019-08-24 03:23:11"
        },
        "status": 1,
        "msg": "update success"
    }
}
```
#### Customer password update Request API
```language
request url: http://localhost:8000/api/customer/passupdate
Method: PUT
Header {
    Accept:application/json
    Authorization:Bearer .$customerAccessToken
    Content-Type:application/x-www-form-urlencoded
}
Body{
    old_password:88888888
    new_password:11111111
    c_password:11111111
}
```
#### Customer password update Response API
```language
{
    "data": {
        "customer": {
            "id": 5,
            "name": "Aung Aung",
            "phone_no": "09111222333",
            "profile_url": "http://www.facebook.com/fjsdkijf",
            "created_at": "2019-08-22 13:18:52",
            "updated_at": "2019-08-24 03:29:34"
        },
        "status": 1,
        "msg": "password change success"
    }
}
```
#### Customer Shop rank CREATE Request API
```language
request url: http://localhost:8000/api/customer/shoprank
Method: POST
Header {
    Accept:application/json
    Authorization:Bearer .$customerAccessToken
    Content-Type:application/x-www-form-urlencoded
}
Body{
    shopuser_id:4
    rank:3
    review:Good(optional)
}
```
#### Customer Shop rank CREATE Response API
```language
{
    "data": {
        "shoprank": {
            "customer_id": 5,
            "shopuser_id": "1",
            "rank": "3",
            "review": null,
            "updated_at": "2019-08-24 07:04:11",
            "created_at": "2019-08-24 07:04:11",
            "id": 50
        },
        "stauts": 1,
        "msg": "success"
    }
}
```
#### Customer Shop rank REVIEW UPDATE Request API
```language
request url: http://localhost:8000/api/customer/shoprank/{shoprank_id}
Method: PUT
Header {
    Accept:application/json
    Authorization:Bearer .$customerAccessToken
    Content-Type:application/x-www-form-urlencoded
}
Body{
    review:Nice
}
```
#### Customer Shop rank REVIEW UPDATE Response API
```language
{
    "data": {
        "shoprank": {
            "id": 48,
            "customer_id": 5,
            "shopuser_id": 4,
            "rank": 3,
            "review": "Nice",
            "created_at": "2019-08-24 07:00:48",
            "updated_at": "2019-08-24 07:06:34"
        },
        "stauts": 1,
        "msg": "success"
    }
}
```
#### Customer Shop rank DELETE Request API
```language
request url: http://localhost:8000/api/customer/shoprank/{shoprank_id}
Method: DELETE
Header {
    Accept:application/json
    Authorization:Bearer .$customerAccessToken
    Content-Type:application/x-www-form-urlencoded
}

```
#### Customer Shop rank DELETE Response API
```language
{
    "data": {
        "id": 48,
        "customer_id": 5,
        "shopuser_id": 4,
        "rank": 3,
        "review": "Nice",
        "created_at": "2019-08-24 07:00:48",
        "updated_at": "2019-08-24 07:06:34"
    },
    "status": "delete success"
}
```
#### Customer Menu rank CREATE Request API
```language
request url: http://localhost:8000/api/customer/menurank
Method: POST
Header {
    Accept:application/json
    Authorization:Bearer .$customerAccessToken
    Content-Type:application/x-www-form-urlencoded
}
Body{
   menu_id:4
    rank:2
    review:Good(optional)
}
```
#### Customer Menu rank CREATE Response API
```language
{
    "data": {
        "menurank": {
            "customer_id": 5,
            "menu_id": "4",
            "rank": "2",
            "review": "Good",
            "updated_at": "2019-08-24 11:03:20",
            "created_at": "2019-08-24 11:03:20",
            "id": 6
        },
        "status": 1,
        "msg": "Rank Success"
    }
}
```
#### Customer Menu rank REVIEW UPDATE Request API
```language
request url: http://localhost:8000/api/customer/menurank/{menurank_id}
Method: PUT
Header {
    Accept:application/json
    Authorization:Bearer .$customerAccessToken
    Content-Type:application/x-www-form-urlencoded
}
Body{
   review:Good Nice
}
```
#### Customer Menu rank REVIEW UPDATE Response API
```language
{
    "data": {
        "id": 6,
        "customer_id": 5,
        "menu_id": 4,
        "rank": 2,
        "review": "Good Nice",
        "created_at": "2019-08-24 11:03:20",
        "updated_at": "2019-08-24 11:06:46"
    },
    "status": "update success"
}
```
#### Customer Menu rank DELETE Request API
```language
request url: http://localhost:8000/api/customer/shoprank/{shoprank_id}
Method: DELETE
Header {
    Accept:application/json
    Authorization:Bearer .$customerAccessToken
    Content-Type:application/x-www-form-urlencoded
}

```
#### Customer Menu rank DELETE Response API
```language
{
    "data": {
        "id": 6,
        "customer_id": 5,
        "menu_id": 4,
        "rank": 2,
        "review": "Good Nice",
        "created_at": "2019-08-24 11:03:20",
        "updated_at": "2019-08-24 11:06:46"
    },
    "status": "delete success"
}
```