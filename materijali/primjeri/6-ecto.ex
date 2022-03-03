from(m in Movie, where: m.id > 1000, select: m.title)
|> Repo.all()

movies = from(m in Movie, where: [stars: 5])

query =
  from(c in Character,
    join: ^movies,
    on: m.id == c.movie_id,
    where: c.name == "Vito Corleone",
    select: {m.title, c.name}
  )

Repo.all(query)
