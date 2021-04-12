Group.create('period': 0)
Group.create('period': 5)
Group.create('period': 25)
Group.create('period': 120)
Group.create('period': 600)       # 10 min
Group.create('period': 3600)      # 1 hour
Group.create('period': 18000)     # 5 hour
Group.create('period': 86400)     # 1 day
Group.create('period': 432000)    # 5 days
Group.create('period': 2160000)   # 25 days
Group.create('period': 10368000)  # 4 month
Group.create('period': 0, 'id': 100) #will never used

Card.create('eng': 'A cat', group_id: '1', 'errors_count': 0)
Card.create('eng': 'A dog', group_id: '1', 'errors_count': 0)
Card.create('eng': 'A table', group_id: '1', 'errors_count': 0)

Answer.create('word': 'Кошка', 'card_id': 1)
Answer.create('word': 'Собака', 'card_id': 2)
Answer.create('word': 'Стол', 'card_id': 3)