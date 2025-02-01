# ProjectPend 

## Цель проекта
Целью данного проекта является создание модели обратного маятника
## Зависимости проекта
1. MCU – модель микроконтроллера, внутри которой находятся все
контроллеры;

1.1. High Level Controller – модель высокоуровневого контроллера;
  
1.2. Low Level Controller – модель низкоуровневого контроллера;

1.3. Control Adapter – преобразователь выхода низкоуровневого
контроллера в управляющие УМ сигналы.

2. Control Object – модель объекта управления;
   
2.1. Power Gain – модель усилителя мощности;

2.2. Motor – модель двигателя;
   
2.3. Current Sensor – модель шунтового датчика тока;

2.4. Reductor – модель редуктора;

2.5. Rack and Pinion – модель реечной передачи;

2.6. Inverse Pendulum – модель динамики обратного маятника;

2.7. Backward Acc Converter – вспомогательная модель,
необходимая для перевода скоростей и ускорения объекта
управления в скорости и ускорения двигателя;

2.8. HallSensor – модель датчика Холла;

2.8.1. Rot Speed Sensor – часть модели датчика холла, измеряющая
угловую скорость;

2.8.2. Rot Angle Sensor – часть модели датчика холла, измеряющая угловое положение.

## Шаги запуска проекта
Для запуска проекта достаточно открыть Shortcut FinalProject.slx

Shortcut представляет собой верхний уровень системы.
