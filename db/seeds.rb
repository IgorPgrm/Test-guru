# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

front = Category.create(title: 'Frontend')
back = Category.create(title: 'Backend')
ml = Category.create(title: 'Machine Learning')
gi = Category.create(title: 'General issues')

test1 = Test.create(title: 'Тест1 HTML', level: 1, category_id: front.id)
test2 = Test.create(title: 'Тест2 Ruby', level: 2, category_id: back.id)
test3 = Test.create(title: 'Тест3 Machine Learning', level: 3, category_id: ml.id)
test4 = Test.create(title: 'Тест4 Общие вопросы', level: 5, category_id: gi.id)
test5 = Test.create(title: 'Тест5 HTML', level: 5, category_id: front.id)
test6 = Test.create(title: 'Тест6 CSS', level: 5, category_id: front.id)

quest1 = Question.create(body: 'Тег <br> в HTML означает:', test_id: test1.id)
quest2 = Question.create(body: 'Ruby это', test_id: test2.id)
quest3 = Question.create(body: 'Какой вид обучения не применяется в ML', test_id: test3.id)
quest4 = Question.create(body: 'Какой тип данных, указывает на число с плавающей запятой', test_id: test4.id)
quest5 = Question.create(body: 'Тег <ruby> в HTML означает:', test_id: test5.id)
quest6 = Question.create(body: 'Значение square в list-style-type означает', test_id: test6.id)

Answer.create(body: 'Создаёт гипертекстовые ссылки.', correct: false, question_id: quest1.id)
Answer.create(body: 'Задает полужирное начертание отрывка текста.', correct: false, question_id: quest1.id)
Answer.create(body: 'Перенос текста на новую строку.', correct: true, question_id: quest1.id)

Answer.create(body: 'Низкоуровневый язык', correct: false, question_id: quest2.id)
Answer.create(body: 'Компилируемый язык', correct: false, question_id: quest2.id)
Answer.create(body: 'Интерпретируемый язык', correct: true, question_id: quest2.id)

Answer.create(body: 'Обучение с учителем ', correct: false, question_id: quest3.id)
Answer.create(body: 'Обучение с подкреплением', correct: false, question_id: quest3.id)
Answer.create(body: 'Обучение с подтверждением', correct: true, question_id: quest3.id)

Answer.create(body: 'Integer', correct: false, question_id: quest4.id)
Answer.create(body: 'Double', correct: false, question_id: quest4.id)
Answer.create(body: 'Float', correct: true, question_id: quest4.id)

Answer.create(body: 'Вставка скрипта на языке Ruby', correct: false, question_id: quest5.id)
Answer.create(body: 'Отмечает вложенный в него текст как дополнительную аннотацию.', correct: false, question_id: quest5.id)
Answer.create(body: 'Контейнер для Восточно-Азиатских символов и их расшифровки.', correct: true, question_id: quest5.id)

Answer.create(body: 'Возводит число в степень 2', correct: false, question_id: quest6.id)
Answer.create(body: 'Квадратная рамка', correct: false, question_id: quest6.id)
Answer.create(body: 'Однотонный квадрат', correct: true, question_id: quest6.id)
