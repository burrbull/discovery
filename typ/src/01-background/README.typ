#import "../../config.typ": *

#h1((en: [Background],
  ru: [Общие сведения],
))

#if lang == "ru" [
  Вы собираетесь написать «bare-metal»-программу на Rust для
  микроконтроллера, то есть без операционной системы. Возможно, вы никогда
  раньше ничего подобного не делали. Это _замечательно_ --- добро
  пожаловать в увлекательное приключение!

  Для начала ответим на несколько базовых вопросов, которые могут у вас
  возникнуть.
]

= #tr((
  en: [What's a microcontroller?],
  ru: [Что такое микроконтроллер?],
))

#tr((
en: [
  A microcontroller is a _system_ on a chip. Whereas your computer is
  made up of several discrete components: a processor, RAM, storage, an
  Ethernet port, etc.; a microcontroller has all those types of components
  built into a single "chip" or package. This makes it possible to build
  systems with fewer parts.
],
ru: [
  Микроконтроллер --- это _система на кристалле_. Ваш компьютер
  состоит из нескольких отдельных компонентов: процессора, оперативной
  памяти, накопителя, порта Ethernet и т. д. А в микроконтроллере все
  такие компоненты объединены в одном «чипе» или корпусе. Благодаря
  этому системы можно строить из меньшего числа деталей.
]))

= #tr((
  en: [What can you do with a microcontroller?],
  ru: [Что можно делать с помощью микроконтроллера?],
))

#tr((
en: [
  Lots of things! Microcontrollers are the central part of what are known
  as "_embedded_ systems". Embedded systems are everywhere, but you
  don't usually notice them. They control the machines that wash your
  clothes, print your documents, and cook your food. Embedded systems keep
  the buildings that you live and work in at a comfortable temperature,
  and control the components that make the vehicles you travel in stop and
  go.
],
ru: [
  Очень многое! Микроконтроллеры --- основа так называемых
  «_встраиваемых_ систем». Встраиваемых систем вокруг очень много,
  но вы обычно их не замечаете. Они управляют машинами, которые стирают
  одежду, печатают документы и готовят еду. Встраиваемые системы
  поддерживают комфортную температуру в зданиях, где вы живёте и
  работаете, и управляют узлами транспортных средств, благодаря которым
  вы едете и останавливаетесь.
]))

#tr((
en: [
  Most embedded systems operate without user intervention. Even if they
  expose a user interface like a washing machine does; most of their
  operation is done on their own.
],
ru: [
  Большинство встраиваемых систем работает без вмешательства
  пользователя. Даже если у них есть интерфейс, как у стиральной машины,
  основную работу они выполняют самостоятельно.
]))

#tr((
en: [
  Embedded systems are often used to _control_ a physical process. To
  make this possible, they have one or more devices to tell them about the
  state of the world ("sensors"), and one or more devices which allow them
  to change things ("actuators"). For example, a building climate control
  system might have:
  - Sensors which measure temperature and humidity in various locations.
  - Actuators which control the speed of fans.
  - Actuators which cause heat to be added or removed from the building.
],
ru: [
  Встраиваемые системы часто используются, чтобы _управлять_
  физическим процессом. Для этого у них есть одно или несколько
  устройств, которые сообщают о состоянии окружающего мира («датчики»),
  и одно или несколько устройств, с помощью которых они что-то меняют
  («исполнительные механизмы»). Например, система климат-контроля здания
  может включать:
  - Датчики, которые измеряют температуру и влажность в разных точках.
  - Исполнительные механизмы, которые регулируют скорость вентиляторов.
  - Исполнительные механизмы, которые добавляют тепло в здание или
    отводят его.
]))

= #tr((
  en: [When should I use a microcontroller?],
  ru: [Когда стоит использовать микроконтроллер?],
))

#tr((
en: [
  Many of the embedded systems listed above could be implemented with a
  computer running Linux (for example a "Raspberry Pi"). Why use a
  microcontroller instead? Sounds like it might be harder to develop a
  program.
],
ru: [
  Многие из перечисленных выше встраиваемых систем можно было бы
  реализовать на компьютере под управлением Linux (например, на
  «Raspberry Pi»). Зачем тогда использовать микроконтроллер? Похоже, что
  программу для него разрабатывать сложнее.
]))

#tr((
en: [
  Some reasons might include:
],
ru: [
    Вот некоторые причины:
]))

#tr((
en: [
  *Cost*. A microcontroller is much cheaper than a general purpose
  computer. Not only is the microcontroller cheaper; it also requires many
  fewer external electrical components to operate. This makes Printed
  Circuit Boards (PCB) smaller and cheaper to design and manufacture.
],
ru: [
  *Стоимость*: микроконтроллер гораздо дешевле компьютера общего
  назначения. Причём он не только дешевле, но и требует намного меньше
  внешних электронных компонентов для работы. Благодаря этому печатные
  платы (PCB) получаются меньше и дешевле и в проектировании, и в
  производстве.
]))

#tr((
en: [
  *Power consumption*. Most microcontrollers consume a fraction of
  the power of a full blown processor. For applications which run on
  batteries, that makes a huge difference.
],
ru: [
  *Энергопотребление*: большинство микроконтроллеров потребляет
  лишь малую долю энергии полноценного процессора. Для устройств,
  работающих от батарей, это огромная разница.
]))

#tr((
en: [
  *Responsiveness*. To accomplish their purpose, some embedded
  systems must always react within a limited time interval (e.g.~the
  "anti-lock" braking system of a car). If the system misses this type of
  _deadline_, a catastrophic failure might occur. Such a deadline is
  called a "hard real time" requirement. An embedded system which is bound
  by such a deadline is referred to as a "hard real-time system". A
  general purpose computer and OS usually has many software components
  which share the computer's processing resources. This makes it harder to
  guarantee execution of a program within tight time constraints.
],
ru: [
  *Отзывчивость*: для выполнения своей задачи некоторым
  встраиваемым системам нужно всегда реагировать в ограниченный
  промежуток времени (например, антиблокировочная система тормозов
  автомобиля). Если система не уложится в такой *срок*, может
  произойти катастрофический отказ. Такое требование называют «жёстким
  реальным временем» (hard real time), а встраиваемую систему, которая
  связана таким сроком, --- «системой жёсткого реального времени». У
  компьютера общего назначения с ОС обычно много программных
  компонентов, которые делят между собой вычислительные ресурсы. Из-за
  этого труднее гарантировать выполнение программы в жёстких временных
  рамках.
]))

#tr((
en: [
  *Reliability*. In systems with fewer components (both hardware
  and software), there is less to go wrong!
],
ru: [
  *Надёжность*: в системах с меньшим числом компонентов (как
  аппаратных, так и программных) меньше возможностей для сбоя!
]))

= #tr((
  en: [When should I _not_ use a microcontroller?],
  ru: [Когда _не_ стоит использовать микроконтроллер?],
))

#tr((
en: [
  Where heavy computations are involved. To keep their power consumption
  low, microcontrollers have very limited computational resources
  available to them. For example, some microcontrollers don't even have
  hardware support for floating point operations. On those devices,
  performing a simple addition of single precision numbers can take
  hundreds of CPU cycles.
]))

if lang == "ru" [
  Микроконтроллеры часто плохо справляются с тяжёлыми вычислениями.
  Чтобы стоимость и энергопотребление оставались низкими, у
  микроконтроллеров ограничены вычислительные ресурсы.

  Микроконтроллеры обычно выполняют меньше инструкций в секунду, чем
  «большие» процессоры. Самые медленные из них могут работать «всего
  лишь» на нескольких миллионах инструкций в секунду. Кроме того,
  полезной работы на одну инструкцию, как правило, выполняется меньше.
  Микроконтроллеры обычно 32-битные, но 16-битные встречаются нередко:
  из-за этого для работы с привычными типами данных Rust может
  понадобиться больше инструкций. У большинства микроконтроллеров нет
  или почти нет «кэша», поэтому инструкции выполняются ровно настолько
  быстро, насколько быстро доступна основная память.

  Некоторые микроконтроллеры не имеют аппаратной поддержки операций с
  плавающей точкой. На таких устройствах сложение двух чисел одинарной
  точности может занять сотни тактов процессора.

  Наконец, памяти у микроконтроллеров обычно немного. Её может быть
  всего 16 КБ для инструкций программы и 4 КБ для данных, что делает
  программирование для таких систем довольно непростым. Объём встроенной
  памяти на единицу стоимости и энергопотребления постоянно растёт, но
  процессор, с которым мы будем работать, по-прежнему располагает «всего
  лишь» 512 КБ памяти для инструкций и 128 КБ для данных --- гораздо
  меньше, чем у «настоящего компьютера».
]

= #tr((
  en: [Why use Rust and not C?],
  ru: [Почему Rust, а не C?],
))

#tr((
en: [
  Hopefully, I don't need to convince you here as you are probably
  familiar with the language differences between Rust and C. One point I
  do want to bring up is package management. C lacks an official, widely
  accepted package management solution whereas Rust has Cargo. This makes
  development _much_ easier. And, IMO, easy package management
  encourages code reuse because libraries can be easily integrated into an
  application which is also a good thing as libraries get more "battle testing".
],
ru: [
  Надеюсь, убеждать вас тут не придётся: вы, вероятно, знакомы с
  различиями между Rust и C. Хочу отдельно отметить управление пакетами.
  У C нет официального и широко принятого решения для управления
  пакетами, а у Rust есть Cargo.
  Благодаря этому разработка становится _заметно_ проще.
  А ещё, по моему мнению, удобное управление
  пакетами поощряет повторное использование кода: библиотеки легко
  подключаются к приложению, а это хорошо, потому что библиотеки
  получают больше «боевой проверки».
]))

= #tr((
  en: [Why should I not use Rust?],
  ru: [Почему не стоит использовать Rust?],
))

#tr((
en: [
  Or why should I prefer C over Rust?
],
ru: [
  Или почему стоит предпочесть C Rust'у?
]))

#let url_rtos = "https://github.com/rust-embedded/awesome-embedded-rust#real-time-operating-system-rtos"
#tr((
en: [
  The C ecosystem is way more mature. Off the shelf solutions for several
  problems already exist. If you need to control a time sensitive process,
  you can grab one of the existing commercial Real Time Operating Systems
  (RTOS) out there and solve your problem. There are no commercial,
  production-grade RTOSes in Rust yet so you would have to either create
  one yourself or try one of the ones that are in development. You can
  find a list of those in the #link(url_rtos)[Awesome Embedded Rust] repository.
],
ru: [
  Экосистема C более зрелая. Для многих задач уже есть готовые решения.
  Если нужно управлять процессом, чувствительным ко времени, можно взять
  одну из существующих коммерческих операционных систем реального
  времени (RTOS) и решить задачу. Коммерческих RTOS промышленного уровня
  на Rust (на момент написания) нет, поэтому придётся либо создать такую
  систему самим, либо попробовать одну из тех, что находятся в
  разработке. Список таких проектов есть в репозитории
  #link(url_rtos)[Awesome Embedded Rust].
]))
