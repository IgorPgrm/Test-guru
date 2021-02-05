user = User.new({first_name: 'Administrator',
                     last_name:'TestGuru',
                     email: 'Admin@testGuru.ru',
                     password: 'testpass',
                     password_confirmation: 'testpass'})
user.confirm
user.type = "Admin"
user.save!
front = Category.create!(title: 'Frontend')
back = Category.create!(title: 'Backend')
ml = Category.create!(title: 'Machine Learning')
gi = Category.create!(title: 'General issues')

test1 = Test.create!(title: 'Тест1 HTML', level: 1, category_id: front.id, author_id: user.id)
test2 = Test.create!(title: 'Тест2 Ruby', level: 2, category_id: back.id, author_id: user.id)
test3 = Test.create!(title: 'Тест3 Machine Learning', level: 3, category_id: ml.id, author_id: user.id)
test4 = Test.create!(title: 'Тест4 Общие вопросы', level: 5, category_id: gi.id, author_id: user.id)
test5 = Test.create!(title: 'Тест5 HTML', level: 5, category_id: front.id, author_id: user.id)
test6 = Test.create!(title: 'Тест6 CSS', level: 5, category_id: front.id, author_id: user.id)

quest1 = Question.create!(body: 'Тег <br> в HTML означает:', test_id: test1.id)
quest2 = Question.create!(body: 'Ruby это', test_id: test2.id)
quest3 = Question.create!(body: 'Какой вид обучения не применяется в ML', test_id: test3.id)
quest4 = Question.create!(body: 'Какой тип данных, указывает на число с плавающей запятой', test_id: test4.id)
quest5 = Question.create!(body: 'Тег <ruby> в HTML означает:', test_id: test5.id)
quest6 = Question.create!(body: 'Значение square в list-style-type означает', test_id: test6.id)
quest7 = Question.create(body: "Как вывести \"Hello TestGuru\" в модальное окно уведомления?")
quest8 = Question.create(body: "Укажите корректные имена переменных?")
quest9 = Question.create(body: "Что выведет консоль? \nconsole.log( 2 ** 3 ** 2)")
quest10 = Question.create(body: "Какие варианты позволят объявить переменную?")
quest11 = Question.create(body: "Как расшифровывается HTML?")
quest12 = Question.create(body: "Какое расширение должны иметь HTML документы?")
quest13 = Question.create(body: "Какой тег позволяет вставлять картинки в HTML документы?")
quest14 = Question.create(body: "Выберите ссылку с правильным синтаксисом.")
quest15 = Question.create(body: "С помощью какого тэга можно сделать текст жирным?")
quest16 = Question.create(body: "Укажите тэг позволяющий создавать заголовки.")
quest17 = Question.create(body: "Укажите тег позволяющий определить таблицу.")
quest18 = Question.create(body: "Укажите тег позволяющий определить упорядоченный список.")
quest19 = Question.create(body: "Выберите перечень, в котором все теги являются устаревшими.")
quest20 = Question.create(body: "В каком месте HTML документа должны определяться теги <title>, <link> и <meta>.")
quest21 = Question.create(body: "Укажите тег позволяющий подключить к HTML документу скрипты выполняющиеся на стороне клиента.")
quest22 = Question.create(body: "Укажите тег позволяющий определить поле для ввода пароля.")
quest23 = Question.create(body: "Как называется технология позволяющая оформлять HTML документы.")
quest24 = Question.create(body: "С помощью какого тэга был создан самый большой заголовок?")
quest25 = Question.create(body: "Библиотека для работы с ML называется")
quest26 = Question.create(body: "Как называется комп. модель восприятия")
quest27 = Question.create(body: "Какое понятие используется в ML для обозначения связей")
quest28 = Question.create(body: "Какого понятия нет в ML")
quest29 = Question.create(body: "В большинстве ЯП, операция И определяется как")
quest30 = Question.create(body: "Файлы изображений с альфа-каналом могут иметь расширение:")


Answer.create!(body: 'Создаёт гипертекстовые ссылки.', correct: false, question_id: quest1.id)
Answer.create!(body: 'Задает полужирное начертание отрывка текста.', correct: false, question_id: quest1.id)
Answer.create!(body: 'Перенос текста на новую строку.', correct: true, question_id: quest1.id)

Answer.create!(body: 'Низкоуровневый язык', correct: false, question_id: quest2.id)
Answer.create!(body: 'Компилируемый язык', correct: false, question_id: quest2.id)
Answer.create!(body: 'Интерпретируемый язык', correct: true, question_id: quest2.id)

Answer.create!(body: 'Обучение с учителем ', correct: false, question_id: quest3.id)
Answer.create!(body: 'Обучение с подкреплением', correct: false, question_id: quest3.id)
Answer.create!(body: 'Обучение с подтверждением', correct: true, question_id: quest3.id)

Answer.create!(body: 'Integer', correct: false, question_id: quest4.id)
Answer.create!(body: 'Double', correct: false, question_id: quest4.id)
Answer.create!(body: 'Float', correct: true, question_id: quest4.id)

Answer.create!(body: 'Вставка скрипта на языке Ruby', correct: false, question_id: quest5.id)
Answer.create!(body: 'Отмечает вложенный в него текст как дополнительную аннотацию.', correct: false, question_id: quest5.id)
Answer.create!(body: 'Контейнер для Восточно-Азиатских символов и их расшифровки.', correct: true, question_id: quest5.id)

Answer.create!(body: 'Возводит число в степень 2', correct: false, question_id: quest6.id)
Answer.create!(body: 'Квадратная рамка', correct: false, question_id: quest6.id)
Answer.create!(body: 'Однотонный квадрат', correct: true, question_id: quest6.id)

Answer.create!(body: 'alert("Hello TestGuru");  ', correct: true, question_id: quest7.id)
Answer.create!(body: 'msg("Hello TestGuru");  ', correct: false, question_id: quest7.id)
Answer.create!(body: 'alertBox("Hello TestGuru");  ', correct: false, question_id: quest7.id)
Answer.create!(body: 'msgBox("Hello TestGuru");  ', correct: false, question_id: quest7.id)

Answer.create!(body: 'foo', correct: true, question_id: quest8.id)
Answer.create!(body: 'with', correct: false, question_id: quest8.id)
Answer.create!(body: '_foo', correct: false, question_id: quest8.id)
Answer.create!(body: '99bar', correct: false, question_id: quest8.id)

Answer.create!(body: '36', correct: false, question_id: quest9.id)
Answer.create!(body: '64', correct: false, question_id: quest9.id)
Answer.create!(body: '512', correct: true, question_id: quest9.id)
Answer.create!(body: '1024', correct: false, question_id: quest9.id)

Answer.create!(body: 'variable carName', correct: false, question_id: quest10.id)
Answer.create!(body: 'var carName', correct: true, question_id: quest10.id)
Answer.create!(body: 'v carName', correct: false, question_id: quest10.id)
Answer.create!(body: 'let carName', correct: false, question_id: quest10.id)

Answer.create!(body: 'HyperThread Mask Language', correct: false, question_id: quest11.id)
Answer.create!(body: 'HyperThread Markup Language', correct: false, question_id: quest11.id)
Answer.create!(body: 'HyperText Mask Language', correct: false, question_id: quest11.id)
Answer.create!(body: 'HyperText Markup Language', correct: true, question_id: quest11.id)

Answer.create!(body: ' .php или .asp', correct: false, question_id: quest12.id)
Answer.create!(body: '.txt или .doc', correct: false, question_id: quest12.id)
Answer.create!(body: '.html или .htm', correct: true, question_id: quest12.id)
Answer.create!(body: '.doc и .docx', correct: false, question_id: quest12.id)

Answer.create!(body: '<pic>', correct: false, question_id: quest13.id)
Answer.create!(body: '<img>', correct: true, question_id: quest13.id)
Answer.create!(body: '<picture>', correct: false, question_id: quest13.id)
Answer.create!(body: '<image> ', correct: false, question_id: quest13.id)

Answer.create!(body: '<a href='https://testguru2021a.herokuapp.com' value='testguru2021a.ru' /> ', correct: false, question_id: quest14.id)
Answer.create!(body: '<a name='https://testguru2021a.herokuapp.com'>https://testguru2021a.herokuapp.com</a> ', correct: false, question_id: quest14.id)
Answer.create!(body: '<a href='https://testguru2021a.herokuapp.com'>testguru2021a</a> ', correct: true, question_id: quest14.id)
Answer.create!(body: '<a src='https://testguru2021a.herokuapp.com'>testguru2021a</a> ', correct: false, question_id: quest14.id)

Answer.create!(body: '<b>', correct: true, question_id: quest15.id)
Answer.create!(body: '<i> ', correct: false, question_id: quest15.id)
Answer.create!(body: '<big> ', correct: false, question_id: quest15.id)
Answer.create!(body: ' <h2>', correct: false, question_id: quest15.id)

Answer.create!(body: '<strong> ', correct: false, question_id: quest16.id)
Answer.create!(body: '<small>', correct: false, question_id: quest16.id)
Answer.create!(body: '<h2> ', correct: false, question_id: quest16.id)
Answer.create!(body: ' <em> ', correct: false, question_id: quest16.id)

Answer.create!(body: '<tab> ', correct: false, question_id: quest17.id)
Answer.create!(body: '<table> ', correct: true, question_id: quest17.id)
Answer.create!(body: '<tr> ', correct: false, question_id: quest17.id)
Answer.create!(body: '<tabs>', correct: false, question_id: quest17.id)

Answer.create!(body: '<ul> ', correct: false, question_id: quest18.id)
Answer.create!(body: '<li>', correct: true, question_id: quest18.id)
Answer.create!(body: '<ol>', correct: false, question_id: quest18.id)
Answer.create!(body: '<list>', correct: false, question_id: quest18.id)

Answer.create!(body: '<strike>, <font> и <center> ', correct: true, question_id: quest19.id)
Answer.create!(body: '<u>, <b> и <s> ', correct: false, question_id: quest19.id)
Answer.create!(body: '<center>, <span> и <div>', correct: false, question_id: quest19.id)
Answer.create!(body: '<menu>, <font> и <span>', correct: false, question_id: quest19.id)

Answer.create!(body: 'Данные теги могут определятся в любом месте документа ', correct: false, question_id: quest20.id)
Answer.create!(body: 'В секции <body> ', correct: false, question_id: quest20.id)
Answer.create!(body: 'В секции <head> ', correct: true, question_id: quest20.id)

Answer.create!(body: '<client> ', correct: false, question_id: quest21.id)
Answer.create!(body: '<applet> ', correct: false, question_id: quest21.id)
Answer.create!(body: '<object>', correct: false, question_id: quest21.id)
Answer.create!(body: '<script>', correct: true, question_id: quest21.id)

Answer.create!(body: '<password> ', correct: false, question_id: quest22.id)
Answer.create!(body: '<input type='password' /> ', correct: true, question_id: quest22.id)
Answer.create!(body: '<pass>', correct: false, question_id: quest22.id)
Answer.create!(body: '<hide>', correct: false, question_id: quest22.id)

Answer.create!(body: 'jQuery ', correct: false, question_id: quest23.id)
Answer.create!(body: 'PHP', correct: false, question_id: quest23.id)
Answer.create!(body: 'CSS', correct: true, question_id: quest23.id)
Answer.create!(body: 'XHTML', correct: false, question_id: quest23.id)

Answer.create!(body: '<b> ', correct: false, question_id: quest24.id)
Answer.create!(body: '<h6> ', correct: false, question_id: quest24.id)
Answer.create!(body: '<h1>', correct: true, question_id: quest24.id)
Answer.create!(body: '<font-size="72">', correct: false, question_id: quest24.id)

Answer.create!(body: 'TensorMentor', correct: false, question_id: quest25.id)
Answer.create!(body: 'TensorFlow', correct: true, question_id: quest25.id)
Answer.create!(body: 'TesnorTeacher', correct: false, question_id: quest25.id)
Answer.create!(body: 'StackOverFlow', correct: false, question_id: quest25.id)

Answer.create!(body: 'Оптрон', correct: false, question_id: quest26.id)
Answer.create!(body: 'Прецептрон', correct: true, question_id: quest26.id)
Answer.create!(body: 'Аксон', correct: false, question_id: quest26.id)
Answer.create!(body: 'Дендрит', correct: false, question_id: quest26.id)

Answer.create!(body: 'объём', correct: false, question_id: quest27.id)
Answer.create!(body: 'вес', correct: true, question_id: quest27.id)
Answer.create!(body: 'длина', correct: false, question_id: quest27.id)
Answer.create!(body: 'линейность', correct: false, question_id: quest27.id)

Answer.create!(body: 'Перцептрон', correct: false, question_id: quest28.id)
Answer.create!(body: 'Перцептроном с последовательными связями', correct: false, question_id: quest28.id)
Answer.create!(body: 'Перцептроном с обратной отрицательной связью', correct: true, question_id: quest28.id)
Answer.create!(body: 'Элементарный перцептрон', correct: false, question_id: quest28.id)

Answer.create!(body: '||', correct: false, question_id: quest29.id)
Answer.create!(body: '&&', correct: true, question_id: quest29.id)
Answer.create!(body: '++', correct: false, question_id: quest29.id)
Answer.create!(body: '||=', correct: false, question_id: quest29.id)

Answer.create!(body: 'PNG', correct: true, question_id: quest30.id)
Answer.create!(body: 'GIF', correct: false, question_id: quest30.id)
Answer.create!(body: 'JPEG', correct: true, question_id: quest30.id)
Answer.create!(body: 'IMG', correct: false, question_id: quest30.id)
