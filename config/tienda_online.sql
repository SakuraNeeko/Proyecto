-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-03-2024 a las 16:11:08
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda_online`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id` int(11) NOT NULL,
  `id_transaccion` varchar(20) NOT NULL,
  `fecha` datetime NOT NULL,
  `status` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `id_cliente` varchar(20) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`id`, `id_transaccion`, `fecha`, `status`, `email`, `id_cliente`, `total`) VALUES
(1, '58F730691B028481S', '2024-03-08 16:07:47', 'COMPLETED', 'sb-gpsw4729648114@personal.example.com', '35JKCY58TG7LG', 529.97),
(2, '1MF38711L0570064E', '2024-03-08 16:09:00', 'COMPLETED', 'sb-gpsw4729648114@personal.example.com', '35JKCY58TG7LG', 179.98),
(3, '35Y53462M3259644C', '2024-03-08 16:10:12', 'COMPLETED', 'sb-gpsw4729648114@personal.example.com', '35JKCY58TG7LG', 889.94);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra`
--

CREATE TABLE `detalle_compra` (
  `id` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `detalle_compra`
--

INSERT INTO `detalle_compra` (`id`, `id_compra`, `id_producto`, `nombre`, `precio`, `cantidad`) VALUES
(1, 1, 11, 'Teclado mecánico Corsair K95 RGB Platinum XT', 199.99, 1),
(2, 1, 44, 'Teclado Mecánico Corsair K70 RGB MK.2 Cherry MX Red (Segunda Mano)', 129.99, 1),
(3, 1, 46, 'Auriculares Inalámbricos Sony WH-1000XM3 (Segunda Mano)', 199.99, 1),
(4, 2, 14, 'Ventilador de CPU Noctua NH-D15', 99.99, 1),
(5, 2, 15, 'Caja de PC NZXT H510', 79.99, 1),
(6, 3, 13, 'Fuente de alimentación EVGA Supernova 850 G5', 129.99, 3),
(7, 3, 17, 'Auriculares inalámbricos HyperX Cloud Flight', 149.99, 2),
(8, 3, 49, 'Tableta Gráfica Wacom Intuos Pro (Segunda Mano)', 199.99, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `descuento` tinyint(3) NOT NULL DEFAULT 0,
  `id_categoria` int(11) NOT NULL,
  `activo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `descuento`, `id_categoria`, `activo`) VALUES
(1, 'Tarjeta Gráfica Video Rx 580 8gb Hdmi Amd Radeon', 'Esta tarjeta gráfica RX 580 de AMD Radeon es una excelente opción para aquellos que buscan un rendimiento sólido a un precio asequible en el mercado de segunda mano. Con 8GB de memoria GDDR5, ofrece un rendimiento gráfico fluido y una calidad visual impresionante en una amplia variedad de juegos y aplicaciones. Equipada con tecnología AMD Radeon FreeSync, proporciona una experiencia de juego sin tearing y sin stuttering para una jugabilidad suave y sin interrupciones. Si buscas un rendimiento sólido a un precio aún más accesible, esta tarjeta de segunda mano es una excelente opción. ', 199.99, 10, 1, 1),
(2, 'Laptop HP Pavilion 15-eh0022la AMD Ryzen 5 8GB RAM 512GB SSD Win10', 'La laptop HP Pavilion 15-eh0022la es una opción atractiva para aquellos que buscan un equilibrio entre rendimiento y portabilidad en el mercado de segunda mano. Con un procesador AMD Ryzen 5, 8GB de RAM y un SSD de 512GB, ofrece un rendimiento rápido y receptivo para tus tareas diarias. Su pantalla de 15.6 pulgadas con resolución Full HD y su diseño delgado y ligero hacen que sea fácil de llevar contigo a todas partes.', 499.99, 0, 1, 1),
(3, 'Dell Inspiron Small Desktop with 13th Gen Intel® Core™ Processor', 'El Dell Inspiron Small Desktop con procesador Intel Core de 13ª generación es una opción sólida para aquellos que buscan un rendimiento versátil en el mercado de segunda mano. Equipado con un procesador Intel Core de última generación, ofrece un rendimiento rápido y eficiente para multitarea, productividad y entretenimiento. ', 699.99, 0, 1, 1),
(4, 'Procesador Intel Core i7-10700K', 'El procesador Intel Core i7-10700K es una unidad potente diseñada para brindar un rendimiento excepcional en juegos y aplicaciones exigentes. Con 8 núcleos y 16 hilos, ofrece una capacidad de procesamiento multitarea fluida y rápida. Con una frecuencia base de 3.80 GHz y la capacidad de alcanzar hasta 5.10 GHz con la tecnología Intel Turbo Boost, este procesador es ideal para usuarios que requieren un alto rendimiento en sus sistemas. Ya sea para gaming, edición de video o diseño gráfico, el Core i7-10700K ofrece la potencia necesaria para enfrentar cualquier tarea.', 399.99, 0, 1, 1),
(5, 'Tarjeta gráfica NVIDIA GeForce RTX 3080', 'a tarjeta gráfica NVIDIA GeForce RTX 3080 es una opción de primera categoría para los entusiastas del gaming y la creación de contenido. Equipada con la arquitectura NVIDIA Ampere, esta tarjeta ofrece un rendimiento excepcional con 10GB de memoria GDDR6X de alta velocidad. Con tecnologías como el trazado de rayos en tiempo real y el DLSS AI, la RTX 3080 proporciona gráficos impresionantes y una experiencia de juego inmersiva. Ya sea que estés jugando los últimos títulos AAA o renderizando proyectos de diseño 3D, la RTX 3080 asegura un rendimiento sin compromisos.', 799.99, 0, 1, 1),
(7, 'Disco SSD Samsung 970 EVO Plus 1TB', 'El disco SSD Samsung 970 EVO Plus ofrece un almacenamiento rápido y confiable para mejorar el rendimiento de tu sistema. Con una capacidad de 1TB, este SSD utiliza la tecnología V-NAND y la interfaz PCIe NVMe para ofrecer velocidades de lectura y escritura excepcionales. Ideal para cargas de trabajo intensivas, juegos y edición de video, el 970 EVO Plus proporciona tiempos de carga más rápidos y una experiencia informática más fluida. Además, cuenta con un factor de forma M.2 que lo hace compatible con una amplia gama de dispositivos. ', 149.99, 0, 1, 1),
(8, 'Memoria RAM Corsair Vengeance RGB Pro 16GB (2x8GB) DDR4 3200MHz', 'La memoria RAM Corsair Vengeance RGB Pro combina un rendimiento excepcional con un diseño llamativo. Con una capacidad total de 16GB (2x8GB) y una velocidad de 3200MHz, esta memoria proporciona un rendimiento rápido y estable para multitarea y gaming. Además, su diseño con iluminación RGB personalizable agrega un toque de estilo a tu sistema. Optimizada para placas base Intel y AMD, la Corsair Vengeance RGB Pro es la elección perfecta para usuarios que buscan rendimiento y estética. ', 99.99, 0, 1, 1),
(9, 'Placa base ASUS ROG Strix Z590-E Gaming WiFi', 'La placa base ASUS ROG Strix Z590-E Gaming WiFi es una opción premium para construir tu sistema de alto rendimiento. Compatible con procesadores Intel de última generación, esta placa ofrece un conjunto completo de características para satisfacer las necesidades de los jugadores y creadores de contenido. Con conectividad WiFi integrada, iluminación RGB Aura Sync y un diseño robusto, la Z590-E Gaming WiFi garantiza un rendimiento confiable y una estética impresionante. Además, cuenta con tecnologías avanzadas como PCIe 4.0 y USB 3.2 Gen 2 para un rendimiento de vanguardia. ', 329.99, 0, 1, 1),
(10, 'Monitor Gaming ASUS ROG Swift PG279Q', 'Sumérgete en la acción con el monitor gaming ASUS ROG Swift PG279Q. Con una pantalla IPS de 27 pulgadas y una resolución WQHD (2560 x 1440), este monitor ofrece imágenes nítidas y detalladas con colores precisos y ángulos de visión amplios. Con una frecuencia de actualización de hasta 165Hz y tecnología G-Sync, disfrutarás de una experiencia de juego suave y libre de tearing. Además, su diseño elegante y ergonómico te permite ajustar la altura, inclinación y giro para una comodidad óptima. Ya sea que estés jugando o trabajando, el PG279Q eleva tu experiencia visual al siguiente nivel.', 699.99, 0, 1, 1),
(11, 'Teclado mecánico Corsair K95 RGB Platinum XT', 'El teclado mecánico Corsair K95 RGB Platinum XT combina un rendimiento excepcional con un diseño premium. Equipado con interruptores Cherry MX Speed para una respuesta ultrarrápida, este teclado garantiza una experiencia de escritura fluida y precisa. Además, cuenta con retroiluminación RGB personalizable por tecla que te permite crear efectos de iluminación impresionantes para adaptarse a tu estilo. Con características adicionales como teclas macro programables, reposamuñecas desmontable y controles multimedia dedicados, el K95 RGB Platinum XT es la elección perfecta para jugadores y profesionales. ', 199.99, 0, 1, 1),
(12, 'Ratón gaming Logitech G502 HERO', 'El ratón gaming Logitech G502 HERO ofrece un rendimiento excepcional y una comodidad duradera para sesiones de juego prolongadas. Equipado con el sensor HERO de 16,000 DPI, este ratón proporciona un seguimiento preciso y sin aceleración en una amplia variedad de superficies. Con 11 botones programables y un sistema de peso ajustable, puedes personalizar el G502 HERO para adaptarse a tu estilo de juego único. Además, su diseño ergonómico con agarres texturizados garantiza un control preciso y cómodo en todo momento. Ya sea que estés jugando shooters, MOBAs o MMOs, el G502 HERO te ayuda a destacar en cualquier situación.', 79.99, 0, 1, 1),
(13, 'Fuente de alimentación EVGA Supernova 850 G5', 'La fuente de alimentación EVGA Supernova 850 G5 ofrece una potencia confiable y eficiente para tu sistema de PC. Con una capacidad de 850W y certificación 80 Plus Gold, esta fuente de alimentación garantiza un suministro estable de energía con una eficiencia excepcional. Además, su diseño modular permite una instalación limpia y sin complicaciones, mientras que el ventilador con rodamiento de fluido garantiza un funcionamiento silencioso incluso bajo cargas pesadas. Respaldada por una garantía de 10 años y la reputación de calidad de EVGA, la Supernova 850 G5 es la opción ideal para sistemas de alto rendimiento.', 129.99, 0, 1, 1),
(14, 'Ventilador de CPU Noctua NH-D15', 'El ventilador de CPU Noctua NH-D15 ofrece un rendimiento de enfriamiento excepcional para tu procesador. Con un diseño de doble torre y dos ventiladores NF-A15 de 140mm, este disipador de calor proporciona una refrigeración óptima incluso para procesadores de alta gama con overclocking. Además, su diseño asimétrico garantiza la compatibilidad con módulos de RAM de gran altura, mientras que la pasta térmica NT-H1 preaplicada asegura una transferencia de calor eficiente. Con una construcción robusta y una reputación de fiabilidad, el NH-D15 es una opción popular entre los entusiastas del PC. ', 99.99, 0, 1, 1),
(15, 'Caja de PC NZXT H510', 'La caja de PC NZXT H510 combina estilo y funcionalidad en un diseño elegante y minimalista. Con un panel lateral de vidrio templado y una estructura de acero resistente, esta caja ofrece una plataforma robusta para construir tu sistema. Además, su diseño compacto y la gestión de cables optimizada garantizan una instalación limpia y ordenada. Con características como un soporte de montaje SSD ajustable y un sistema de refrigeración eficiente, el H510 proporciona un entorno ideal para tus componentes. Ya sea que estés construyendo un PC de gaming o de trabajo, el NZXT H510 ofrece un equilibrio perfecto entre forma y función.', 79.99, 0, 1, 1),
(16, 'Webcam Logitech C920 HD Pro', 'La webcam Logitech C920 HD Pro ofrece una calidad de video excepcional para tus videollamadas, transmisiones y grabaciones. Con resolución Full HD 1080p y corrección automática de iluminación, esta webcam captura imágenes nítidas y claras en cualquier entorno. Además, su lente de cristal y enfoque automático garantizan una calidad de imagen consistente en todo momento. Conexión USB plug-and-play y compatibilidad con una amplia variedad de aplicaciones de video, la C920 HD Pro es la elección perfecta para usuarios que buscan una webcam confiable y de alta calidad. ', 69.99, 0, 1, 1),
(17, 'Auriculares inalámbricos HyperX Cloud Flight', 'Los auriculares inalámbricos HyperX Cloud Flight ofrecen un rendimiento de audio superior y una comodidad duradera para largas sesiones de juego. Equipados con sonido envolvente 7.1 virtual y controladores de 50mm, estos auriculares proporcionan una experiencia de audio inmersiva con una claridad excepcional. Además, su batería de larga duración ofrece hasta 30 horas de reproducción continua, lo que te permite jugar sin interrupciones durante todo el día. Con un diseño ligero y almohadillas de espuma viscoelástica, los Cloud Flight garantizan una comodidad óptima incluso durante las sesiones de juego más intensas. ', 149.99, 0, 1, 1),
(18, 'Impresora multifunción HP LaserJet Pro MFP M428fdw', 'La impresora multifunción HP LaserJet Pro MFP M428fdw ofrece una combinación de impresión rápida, escaneo de alta calidad, copia y fax en un dispositivo compacto y fácil de usar. Con una velocidad de impresión de hasta 40 páginas por minuto y conectividad WiFi y Ethernet, esta impresora es ideal para entornos de oficina ocupados. Además, su alimentador automático de documentos de 50 hojas y su capacidad para imprimir a doble cara de forma automática te ayudan a ahorrar tiempo y papel. Con la calidad de impresión HP confiable y la conveniencia de las funciones de escaneo y copia, la M428fdw es la elección perfecta para aumentar la productividad en tu lugar de trabajo. ', 349.99, 0, 1, 1),
(19, 'Kit de herramientas de reparación de PC iFixit Pro Tech Toolkit', 'El kit de herramientas de reparación de PC iFixit Pro Tech Toolkit proporciona todo lo que necesitas para reparar ordenadores, teléfonos y otros dispositivos electrónicos. Con más de 70 piezas, incluyendo destornilladores, pinzas, palancas y herramientas de apertura, este kit te permite desmontar y reparar dispositivos con facilidad y seguridad. Además, su diseño compacto y duradero hace que sea fácil de transportar y almacenar. Ya sea que seas un profesional de la reparación o un entusiasta del bricolaje, el iFixit Pro Tech Toolkit es una adición indispensable a tu arsenal de herramientas.', 69.99, 0, 1, 1),
(20, 'Router WiFi TP-Link Archer AX6000', 'El router WiFi TP-Link Archer AX6000 ofrece velocidades ultrarrápidas y una cobertura excepcional para satisfacer las necesidades de tus dispositivos conectados. Con tecnología WiFi 6 y velocidades de hasta 6 Gbps, este router proporciona un rendimiento superior para gaming, streaming y descargas intensivas. Además, su potente procesador de cuatro núcleos y ocho antenas de alta ganancia garantizan una conectividad confiable en todo tu hogar u oficina. Con características adicionales como Beamforming, MU-MIMO y configuración fácil con la aplicación Tether, el Archer AX6000 ofrece una experiencia de red sin igual.', 299.99, 0, 1, 1),
(21, 'Adaptador Bluetooth USB Avantree DG60', 'El adaptador Bluetooth USB Avantree DG60 te permite agregar conectividad Bluetooth a tu PC de forma rápida y sencilla. Con tecnología Bluetooth 5.0 y soporte de baja latencia aptX y aptX HD, este adaptador ofrece una calidad de audio excepcional para tus auriculares y altavoces inalámbricos. Además, su diseño compacto y plug-and-play garantiza una instalación sin problemas en cualquier sistema compatible con USB. Ya sea que estés escuchando música, viendo películas o jugando juegos, el DG60 te ofrece una conexión Bluetooth confiable y de alta calidad.', 24.99, 0, 1, 1),
(22, 'Cable HDMI 2.1 de 3 metros Ultra High Speed', 'El cable HDMI 2.1 de 3 metros Ultra High Speed proporciona una conexión confiable y de alta calidad para tus dispositivos compatibles. Con soporte para resolución 8K, HDR y frecuencias de actualización de hasta 120Hz, este cable te permite disfrutar de una experiencia visual impresionante en tus dispositivos HDMI 2.1. Además, su construcción duradera y los conectores chapados en oro garantizan una transmisión de señal estable y sin interferencias. Ya sea que estés conectando tu consola de juegos, reproductor de Blu-ray o PC a tu televisor o monitor, el cable HDMI Ultra High Speed te ofrece la mejor calidad de imagen y sonido.', 19.99, 0, 1, 1),
(23, 'Hub USB-C Anker PowerExpand+ 7-in-1', 'El hub USB-C Anker PowerExpand+ 7-in-1 te proporciona una amplia variedad de puertos para expandir la conectividad de tu dispositivo USB-C. Con puertos HDMI, USB 3.0, lector de tarjetas SD/microSD y carga passthrough de 100W, este hub te permite conectar múltiples dispositivos simultáneamente y cargar tu dispositivo USB-C al mismo tiempo. Además, su diseño compacto y elegante hace que sea fácil de transportar y usar en cualquier lugar. Ya sea que estés trabajando, viendo contenido multimedia o transfiriendo archivos, el hub USB-C Anker PowerExpand+ 7-in-1 te ofrece la versatilidad que necesitas. ', 49.99, 0, 1, 1),
(43, 'Monitor Gaming ASUS VG248QE 24\" Full HD 144Hz  (Segunda Mano)', 'El monitor ASUS VG248QE es una opción popular entre los jugadores que buscan una experiencia de juego fluida y sin problemas. Con una pantalla de 24 pulgadas y resolución Full HD, ofrece imágenes nítidas y detalladas. Su frecuencia de actualización de 144Hz garantiza una jugabilidad suave y sin tearing, mientras que la tecnología de reducción de desenfoque mejora la claridad de las imágenes en movimiento. Esta versión de segunda mano proporciona una excelente opción para aquellos que buscan un monitor de calidad a un precio más accesible. ', 199.99, 0, 1, 1),
(44, 'Teclado Mecánico Corsair K70 RGB MK.2 Cherry MX Red (Segunda Mano)', 'El teclado mecánico Corsair K70 RGB MK.2 es una opción premium para aquellos que buscan un rendimiento excepcional y una estética llamativa. Equipado con interruptores Cherry MX Red para una respuesta suave y lineal, ofrece una experiencia de escritura cómoda y precisa. Su retroiluminación RGB personalizable permite crear efectos de iluminación impresionantes para adaptarse a tu estilo. ', 129.99, 0, 1, 1),
(45, 'Impresora Multifunción HP OfficeJet Pro 9015 (Segunda Mano)', 'La impresora multifunción HP OfficeJet Pro 9015 es una opción versátil y eficiente para entornos de oficina doméstica o pequeñas empresas. Con capacidad para imprimir, escanear, copiar y enviar faxes, ofrece todas las funciones esenciales que necesitas para mantenerte productivo. Su velocidad de impresión rápida, calidad de impresión profesional y funciones avanzadas como la impresión móvil hacen que sea una opción conveniente para satisfacer tus necesidades de impresión diarias.', 149.99, 0, 1, 1),
(46, 'Auriculares Inalámbricos Sony WH-1000XM3 (Segunda Mano)', 'Los auriculares inalámbricos Sony WH-1000XM3 son conocidos por su excelente calidad de sonido, comodidad y características avanzadas de cancelación de ruido. Con tecnología de cancelación de ruido adaptativa, te sumergirás en tu música sin distracciones externas. Además, su diseño ergonómico y almohadillas suaves garantizan una experiencia auditiva cómoda incluso durante largas sesiones de escucha. Esta versión de segunda mano ofrece una excelente opción para aquellos que buscan auriculares premium a un precio más accesible.', 199.99, 0, 1, 1),
(47, 'Silla de Oficina Ergonómica (Segunda Mano)', 'Una silla de oficina ergonómica es esencial para mantener una postura cómoda y saludable durante largas horas de trabajo. Esta silla de segunda mano ofrece características ajustables como altura del asiento, inclinación del respaldo y reposabrazos para adaptarse a tus necesidades individuales. Con un diseño acolchado y transpirable, proporciona comodidad y soporte durante todo el día. ', 99.99, 0, 1, 1),
(48, 'Router WiFi Mesh Google Nest WiFi (Segunda Mano)', 'El router WiFi Mesh Google Nest WiFi proporciona una cobertura confiable y rápida en todo tu hogar. Con tecnología de malla, crea una red inalámbrica unificada que elimina los puntos muertos y garantiza una conexión estable en todas partes. Además, su diseño elegante y compacto se integra perfectamente en cualquier hogar. ', 149.99, 0, 1, 1),
(49, 'Tableta Gráfica Wacom Intuos Pro (Segunda Mano)', 'La tableta gráfica Wacom Intuos Pro es una herramienta imprescindible para artistas y diseñadores que buscan precisión y control en sus proyectos digitales. Con niveles de presión sensibles a la inclinación y sensibilidad táctil, te permite crear con precisión y fluidez. Su diseño ergonómico y área activa generosa proporcionan una experiencia de dibujo cómoda y natural. ', 199.99, 0, 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
