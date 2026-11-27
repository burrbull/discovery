#import "../config.typ": *

#h1((en: [Discovery],
  ru: [`micro::bit v2` Embedded Discovery: учебник],
))

#quote(block: true)[
#let url_rust = "https://www.rust-lang.org/"
#tr((
en: [
  Discover the world of microcontrollers through #link(url_rust)[Rust]!
],
ru: [
  Откройте для себя мир микроконтроллеров с помощью #link(url_rust)[Rust]!
]))
]

#tr((
en: [
  This book is an introductory course on microcontroller-based embedded
  systems that uses Rust as the teaching language rather than the usual
  C/C++.
],
ru: [
  Эта книга --- вводный курс по встраиваемым системам на базе
  микроконтроллеров, в котором для обучения используется Rust, а не
  привычные C/C++.
]))

= #tr((
  en: [Scope],
  ru: [Охват тем],
))

#tr((
en: [
  The following topics will be covered (eventually, I hope):
  - How to write, build, flash and debug an "embedded" (Rust) program.
  - Functionality ("peripherals") commonly found in microcontrollers:
    Digital input and output, Pulse Width Modulation (PWM), Analog to
    Digital Converters (ADC), common communication protocols like Serial,
    I2C and SPI, etc.
  - Multitasking concepts: cooperative vs preemptive multitasking,
    interrupts, schedulers, etc.
  - Control systems concepts: sensors, calibration, digital filters,
    actuators, open loop control, closed loop control, etc.
],
ru: [
  В книге планируется рассмотреть следующие темы (со временем, надеюсь):
  - Как написать, собрать, прошить и отладить «встраиваемую» программу на
    Rust.
  - Функциональные блоки («периферия»), которые обычно есть в
    микроконтроллерах: цифровой ввод и вывод, широтно-импульсная модуляция
    (ШИМ, PWM), аналого-цифровые преобразователи (АЦП, ADC),
    распространённые протоколы связи, такие как Serial, I2C и SPI, и т. д.
  - Концепции многозадачности: кооперативная и вытесняющая
    многозадачность, прерывания, планировщики и т. д.
  - Концепции систем управления: датчики, калибровка, цифровые фильтры,
    исполнительные механизмы, управление без обратной связи, управление с
    обратной связью и т. д.
]))

= #tr((
  en: [Approach],
  ru: [Подход],
))

#tr((
en: [
  - Beginner friendly. No previous experience with microcontrollers or
    embedded systems is required.
  - Hands on. Plenty of exercises to put the theory into practice.
    _You_ will be doing most of the work here.
  - Tool centered. We'll make plenty use of tooling to ease development.
    "Real" debugging, with GDB, and logging will be introduced early on.
    Using LEDs as a debugging mechanism has no place here.
],
ru: [
  - Рассчитано на новичков. Опыт работы с микроконтроллерами или
    встраиваемыми системами не требуется.
  - Практика прежде всего. Много упражнений, чтобы применить теорию на
    деле. Основную работу здесь выполняете _вы_.
  - Ориентация на инструменты. Мы активно используем инструменты, чтобы
    упростить разработку. Настоящая отладка с GDB и логирование появятся
    уже в начале. Светодиоды как средство отладки здесь не используются.
]))

= #tr((
  en: [Non-goals],
  ru: [Чего в книге нет],
))

#tr((
en: [
  What's out of scope for this book:
  - Teaching Rust. There's plenty of material on that topic already. We'll
    focus on microcontrollers and embedded systems.
  - Being a comprehensive text about electric circuit theory or
    electronics. We'll just cover the minimum required to understand how
    some devices work.
  - Covering details such as linker scripts and the boot process. For
    example, we'll use existing tools to help get your code onto your
    board, but not go into detail about how those tools work.
],
ru: [
  Что выходит за рамки этой книги:
  - Обучение самому Rust. Материалов по этой теме уже достаточно. Мы
    сосредоточимся на микроконтроллерах и встраиваемых системах.
  - Исчерпывающий учебник по теории электрических цепей или электронике.
    Мы разберём лишь минимум, необходимый, чтобы понять принцип работы
    некоторых устройств.
  - Подробности вроде скриптов компоновщика и процесса загрузки. Например,
    мы будем использовать готовые инструменты, чтобы доставить ваш код на
    плату, но не станем подробно объяснять, как эти инструменты устроены.
]))

#tr((
en: [
  Also I don't intend to port this material to other development boards;
  this book will make exclusive use of the micro:bit development board.
],
ru: [
  Кроме того, я не планирую переносить материал на другие отладочные
  платы: книга целиком построена на отладочной плате micro:bit.
]))

= #tr((
  en: [Reporting problems],
  ru: [Сообщения о проблемах],
))

#let url_repository = "https://github.com/rust-embedded/discovery"
#let url_issues = "https://github.com/rust-embedded/discovery/issues"
#tr((
en: [
  The source of this book is in #link(url_repository)[this repository].
  If you encounter any typo or problem with the code report it on the
  #link(url_issues)[issue tracker].
],
ru: [
  Исходный код книги находится в #link(url_repository)[этом репозитории].
  Если вы заметили опечатку или проблему в коде, сообщите о ней в
  #link(url_issues)[трекере задач].
]))

= #tr((
  en: [Other embedded Rust resources],
  ru: [Другие ресурсы по встраиваемому Rust],
))

#let url_wg = "https://github.com/rust-embedded/wg"
#let url_books = "https://docs.rust-embedded.org"
#let url_faq = "https://docs.rust-embedded.org/faq.html"
#tr((
en: [
  This Discovery book is just one of several embedded Rust resources
  provided by the #link(url_wg)[Embedded Working Group].
  The full selection can be found at
  #link(url_books)[The Embedded Rust Bookshelf].
  This includes the list of
  #link(url_faq)[Frequently Asked Questions].
],
ru: [
  Эта книга Discovery --- лишь один из нескольких ресурсов по
  встраиваемому Rust, которые предоставляет
  #link(url_wg)[Embedded Working Group].
  Полный список можно найти в
  #link(url_books)[The Embedded Rust Bookshelf].
  Там же есть
  #link(url_faq)[часто задаваемые вопросы].
]))
