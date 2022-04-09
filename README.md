# Head First. Ruby.
## Примеры из книги, покрытые тестами с помощью [RSpec](https://rspec.info/) с акцентом на рассматриваемую в данной главе тему.
____

## Для запуска тестов.
____

```
git clone this_repo
gem install rspec (использовалась версия RSpec 3.10)
cd this_repo
rspec spec
```

## 14 Глава. Веб-приложение.
____

В 14-15 главах приводится принцип работы простого веб-приложения с использованием библиотеки [Sinatra](https://github.com/sinatra/sinatra). Модульные тесты реализованы с помощью библиотеки [Minitest](https://github.com/seattlerb/minitest).

Для запуска приложения:

```
cd lib/Ch_14/movies
bundle install
bundle exec ruby app.rb
```

Для запуска тестов:
```
ruby tests/test_app.rb
```
