SELECT user.user_ID, user.name, user.surname, user.country, SUM(subscription.total) AS total_payment
FROM music_streaming_sevice.user
INNER JOIN music_streaming_sevice.subscription ON user.user_ID = subscription.user_id
GROUP BY user.user_ID
ORDER BY total_payment ASC;