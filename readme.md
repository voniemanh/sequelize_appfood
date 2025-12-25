1. API like:
http://localhost:3069/api/like/like
Method: POST
Body:
{
  "user_id": 2,
  "res_id": 2
}

2. API unlike:
http://localhost:3069/api/like/unlike
Method: PATCH
Body:
{
  "user_id": 2,
  "res_id": 2
}
3. API get likes by restaurant id:
http://localhost:3069/api/like/restaurant/{id}
Method: GET

4. API get likes by user id:
http://localhost:3069/api/like/user/{id}
Method: GET

5. API add order:
http://localhost:3069/api/order/add-order
Method: POST
Body:
{
  "user_id": 2,
  "restaurant_id": 4,
  "food_id": 7,
  "code": "ORD123",
  "arr_sub_id": 1,
  "total_price": 234,
  "amount": 342345
}
5. API get restaurant rate
http://localhost:3069/api/rate/restaurant/{id}
Method: GET

6. API get user rate
http://localhost:3069/api/rate/user/{id}
Method: GET