﻿namespace TelerikMovieDatabase.Data.MongoDb
{
	using System;
	using System.Collections.Generic;
	using System.Linq;
	using TelerikMovieDatabase.Data.MongoDb.Models;
	using TelerikMovieDatabase.Models;

	internal class MovieMapper
	{
		private readonly HashSet<Person> persons = new HashSet<Person>();
		private readonly HashSet<Genre> genres = new HashSet<Genre>();
		private readonly HashSet<Country> countries = new HashSet<Country>();
		private readonly HashSet<Language> languages = new HashSet<Language>();
		private readonly HashSet<JobPosition> jobs = new HashSet<JobPosition>();

		private int movieID = 1;
		private int personID = 1;
		private int genreID = 1;
		private int countryID = 1;
		private int languageID = 1;
		private int jobID = 1;

		public IEnumerable<MongoDbMovie> Map(IEnumerable<Movie> movies)
		{
			var mongoDbMovies = new HashSet<MongoDbMovie>();

			foreach (var movie in movies)
			{
				var mongoDbMovie = this.Map(movie);
				mongoDbMovies.Add(mongoDbMovie);
			}

			return mongoDbMovies;
		}

		public MongoDbMovie Map(Movie movie)
		{
			var director = persons.SingleOrDefault(i => i.Name == movie.Director.Name
				&& i.Jobs.All(job => movie.Director.Jobs.Contains(job)));

			if (director == null)
			{
				persons.Add(movie.Director);
				director = movie.Director;
				director.ID = personID++;
			}

			var movieWriters = new HashSet<Person>();
			foreach (var writer in movie.Writers)
			{
				var movieWriter = persons.SingleOrDefault(i => i.Name == writer.Name
				&& i.Jobs.All(job => writer.Jobs.Contains(job)));

				if (movieWriter == null)
				{
					persons.Add(writer);
					movieWriter = writer;
					movieWriter.ID = personID++;
				}

				movieWriters.Add(movieWriter);
			}

			var movieCast = new HashSet<Person>();
			foreach (var actor in movie.Cast)
			{
				var movieActor = persons.SingleOrDefault(i => i.Name == actor.Name
				&& i.Jobs.All(job => actor.Jobs.Contains(job)));

				if (movieActor == null)
				{
					persons.Add(actor);
					movieActor = actor;
					movieActor.ID = personID++;
				}

				movieCast.Add(movieActor);
			}

			var movieGenres = new HashSet<Genre>();
			foreach (var genre in movie.Genres)
			{
				var movieGenre = genres.SingleOrDefault(i => i.Title == genre.Title);

				if (movieGenre == null)
				{
					genres.Add(genre);
					movieGenre = genre;
					movieGenre.ID = genreID++;
				}

				movieGenres.Add(movieGenre);
			}

			var movieCountries = new HashSet<Country>();
			foreach (var country in movie.Countries)
			{
				var movieCountry = countries.SingleOrDefault(i => i.Name == country.Name);

				if (movieCountry == null)
				{
					countries.Add(country);
					movieCountry = country;
					movieCountry.ID = countryID++;
				}

				movieCountries.Add(movieCountry);
			}

			var movieLanguages = new HashSet<Language>();
			foreach (var language in movie.Languages)
			{
				var movieLanguage = languages.SingleOrDefault(i => i.Name == language.Name);

				if (movieLanguage == null)
				{
					languages.Add(language);
					movieLanguage = language;
					movieLanguage.ID = languageID++;
				}

				movieLanguages.Add(movieLanguage);
			}

			var movieProjection = new MongoDbMovie
			{
				_id = movieID++,
				Title = movie.Title,
				Storyline = movie.Storyline,
				RunningTime = movie.RunningTime,
				Metascore = movie.Metascore,
				Rated = movie.Rated,
				Rating = movie.Rating,
				//Poster = movie.Poster,
				ReleaseDate = movie.ReleaseDate,
				Director_id = director.ID,
				Writers = movieWriters.Select(i => i.ID),
				Cast = movieCast.Select(i => i.ID),
				Genres = movieGenres.Select(i => i.ID),
				Countries = movieCountries.Select(i => i.ID),
				Languages = movieLanguages.Select(i => i.ID),
			};

			return movieProjection;
		}

		public IEnumerable<MongoDbPerson> GetPersonProjections()
		{
			var personProjections = new HashSet<MongoDbPerson>();

			foreach (var person in persons)
			{
				var personJobs = new HashSet<JobPosition>();
				foreach (var job in person.Jobs)
				{
					var personJob = jobs.SingleOrDefault(i => i.Type == job.Type);

					if (personJob == null)
					{
						jobs.Add(job);
						personJob = job;
						personJob.ID = jobID++;
					}

					personJobs.Add(personJob);
				}

				var personProjection = new MongoDbPerson
				{
					_id = person.ID,
					Name = person.Name,
					Jobs = personJobs.Select(i => i.ID)
				};

				personProjections.Add(personProjection);
			}

			return personProjections;
		}

		public IEnumerable<MongoDbGenre> GetGenreProjections()
		{
			return this.GetProjections(this.genres, item => new MongoDbGenre { _id = item.ID, Title = item.Title });
		}

		public IEnumerable<MongoDbCountry> GetCountryProjections()
		{
			return this.GetProjections(this.countries, item => new MongoDbCountry { _id = item.ID, Name = item.Name });
		}

		public IEnumerable<MongoDbLanguage> GetLanguageProjections()
		{
			return this.GetProjections(this.languages, item => new MongoDbLanguage { _id = item.ID, Name = item.Name });
		}

		public IEnumerable<MongoDbJob> GetJobProjections()
		{
			return this.GetProjections(this.jobs, item => new MongoDbJob { _id = item.ID, Type = item.Type });
		}

		public IEnumerable<TModel> GetProjections<TEntity, TModel>(IEnumerable<TEntity> collection, Func<TEntity, TModel> getProjection)
		{
			var projections = new HashSet<TModel>();

			foreach (var item in collection)
			{
				var projection = getProjection(item);
				projections.Add(projection);
			}

			return projections;
		}
	}
}