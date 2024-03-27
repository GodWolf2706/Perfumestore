-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2022 at 09:15 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perfumestore`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productPrice` decimal(10,0) NOT NULL,
  `productImage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`) VALUES
(1, 'Chanel\r\n', 1),
(2, 'D&G', 1),
(3, 'Coach', 1),
(4, 'Gucci\r\n', 1),
(5, 'Lacome', 1),
(6, 'Dior', 1),
(7, 'Hermes', 1),
(8, 'Valentino', 1),
(9, 'Versace', 1),
(10, 'Bvlgari', 1),
(11, 'Chloe', 1),
(12, 'CK', 1),
(13, 'Guerlain', 1),
(14, 'LeLabo', 1),
(15, 'YSL', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdDate` date NOT NULL,
  `receivedDate` date DEFAULT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `createdDate`, `receivedDate`, `status`) VALUES
(42, 33, '2022-06-11', '2022-06-14', 'Delivering');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `productPrice` decimal(10,0) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productImage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `orderId`, `productId`, `qty`, `productPrice`, `productName`, `productImage`) VALUES
(42, 42, 8, 1, '1590000', 'Chloe-Love-Story-For-Women', '7b0f2c83b1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `originalPrice` decimal(10,0) NOT NULL,
  `promotionPrice` decimal(10,0) NOT NULL,
  `image` varchar(50) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdDate` date NOT NULL,
  `cateId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `des` varchar(1000) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `soldCount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `originalPrice`, `promotionPrice`, `image`, `createdBy`, `createdDate`, `cateId`, `qty`, `des`, `status`, `soldCount`) VALUES
(1, 'Bvlgari-Rose-Goldea', '2000000', '1350000', '4b88fc26bc.jpg', 1, '0000-00-00', 10, 9, 'Các nốt hương được bố trí rất khéo léo và tinh tế ngay từ tầng hương đầu tiên, đặc biệt là Xạ hương. Khi bắt đầu mở ra màn trình diễn của mình, Rose Goldea đã khiến bất kỳ ai đối diện cũng phải thấy quyến luyến và gần gũi nơi da thịt bởi chất xúc tác mãnh liệt của Xạ hương. Ấy thế, Rose Goldea của chúng ta vẫn không hề thiếu đi sự thuỳ mị và dịu dàng với Lựu và Cam bergamot.', 1, 4),
(2, 'Bvlgari-Aqva-Amara', '1650000', '1450000', 'e46349d5a6.jpg', 1, '0000-00-00', 10, 96, 'Nước hoa nam Bvlgari Aqva Amara chứa đựng cảm hứng từ sự sang trọng vô hạn của bờ biển Địa Trung Hải mang đến hương thơm tràn đầy năng lượng và ánh sáng mạnh mẽ, nam tính. Mùi hương là sự hòa quyện tuyệt vời của cây cỏ và hương rừng nước Ý', 1, 4),
(3, 'Bvlgari-Man-Extreme', '2345000', '1850000', 'ed88d14e2a.jpg', 1, '0000-00-00', 10, 9, 'Nước hoa Man Extreme được giới thiệu là một chai nước hoa có hương thơm rất thanh lịch, sâu lắng, hấp dẫn và nồng nàn. Hương thơm gây sự thích thú ngay từ lớp hương đầu với hương bưởi hồng và cam bergamot của vùng Calabria. Các hương cam chanh kết hợp với hương vỏ cây xương rồng giúp tạo nên sự hấp dẫn và duyên dáng trong hương thơm mở đầu và làm nổi bật thêm lớp hương giữa hoa cỏ nồng nàn. Tiếp đến hoa lan Nam Phi trắng nở rộ và được bao bọc trong hương thơm của bạch đậu khấu của vùng Guatemala và hổ phách ấm áp.', 1, 1),
(4, 'Bvlgari Omnia Golden Citrine', '1880000', '1550000', '57c2014f70.jpg', 1, '0000-00-00', 10, 19, 'Bvlgari Omnia Golden Citrine được tinh tế chắt lọc những tinh túy của hương liệu thiên nhiên. Quả Quýt Hồng Sicilian và quả đào trắng mở ra một Golden Citrine rực rỡ, mang những thanh âm tích cực cho một ngày mới đầy năng lượng. Hoa Ylang-Ylang lại mô tả về một người phụ nữ hiện đại, đang tuổi xuân thì đầy nữ tính. Cuối cùng, đọng lại trên làn da là hương tuyết tùng lắng xuống, đọng lại cùng benzoin khiến tỏa sáng nhẹ nhàng, nữ tính và thể hiện những giá trị tiềm tàng vượt thời gian của chính nó', 1, 1),
(5, 'Chanel-Bleu-De-Chane', '4800000', '3250000', '10f77e2902.jpg', 1, '0000-00-00', 2, 8, 'Chai nước hoa thuộc dòng Chanel Bleu mang một sự tươi trẻ thơm mát mở ra, kéo dài trên sự ấm áp, đong đầy cảm giác nghiện của gỗ tuyết tùng và gỗ đàn hương từ New Caledonia quét qua hương thơm mãnh liệt từ gỗ. Chai nước hoa của chanel phá vỡ mọi qui ước, mọi khuôn khổ mang đến hương thơm gợi cảm, lịch lãm và đầy bản lĩnh của phái mạnh.', 1, 2),
(6, 'Chanel-Chance', '3600000', '3150000', '2fabc2cd5e.jpg', 1, '0000-00-00', 2, 7, 'Hương thơm của chai nước hoa là sự pha trộn đầy bất ngờ, mọi điều buồn tẻ sẽ tan biến và mở ra những cánh cửa của sự khác lạ và hấp dẫn để khiến bạn không thể chờ đợi', 1, 3),
(7, 'Chanel-Coco-Mademoiselle', '3190000', '3190000', '127bc8f057.jpg', 1, '2021-12-07', 2, 8, 'Nước hoa Coco Mademoiselle Eau de Parfum của thương hiệu Chanel mở đầu bằng mùi hương tươi mát của Cam và Hoa cam hòa quyện cùng chút thanh chua của quả Quýt Hồng.  Coco Mademoiselle là hiện thân của một người phụ nữ mạnh mẽ, cuốn hút với phong cách rất đỗi đàn bà, Hoa trinh nữ và hoa nhài đua nhau tỏa hương gợi sự tò mò và chú ý tới những người xung quanh, và rồi kết thúc tầng hương thứ hai trọn vẹn với Hoa Hồng Thổ Nhĩ Kỳ đầy hấp dẫn.', 1, 2),
(8, 'Chloe-Love-Story-For-Women', '2800000', '1590000', '7b0f2c83b1.jpg', 1, '2021-12-07', 11, 6, 'Dòng nước hoa này mang đến sự quyến rũ, tươi mới với hương hoa cỏ đậm đà mang lại cảm giác thuần khiết và được thiết kế để phù hợp với phong cách giản dị, tự nhiên, năng động và đầy thu hút.\r\nLove Story mở đầu với tinh dầu hoa cam pha lẫn với tinh chất hoa cam quyến rũ đồng thời phải kể đến phong vị vô cùng tinh tế của loài hình sao mang tên hoa lài trâu. Tất cả hòa quyện một cách đầy dịu dàng để tạo ra mùi hương đặc trưng của Love Story.', 1, 4),
(9, 'Chloe-Nomade-Absolu', '4200000', '4200000', '370cc18ee0.jpg', 1, '2021-12-07', 11, 6, 'Là một mùi hương Chypre, Nomade Absolu de Parfum rất dễ mặc và đáng yêu khi mở đầu bằng hương mận anh đào mọng nước, đáng yêu và dễ chịu, kết hợp với rêu sồi xanh và mịn, khiến mùi hương trở nên dễ mặc và đa dụng hơn rất nhiều với các quý cô. Khi khô xuống, hương gỗ đàn hương hiện ra, thơm ngậy và êm dịu cùng xạ hương trắng quyến rũ khết hợp với nhau, tạo nên một sự bí ẩn thú vị cho mùi hương này.\r\n\r\n', 1, 4),
(10, 'Chloe-Rose-De-Chloe', '3160000', '2300000', 'd7e9fca7b2.jpg', 1, '2021-12-07', 11, 10, 'Roses De Chloe mở đầu với mùi hương ngọt mọng tinh nghịch đến từ quả vải, một chút tươi xanh của cam Bergamot. Thoang thoảng đằng sau hương trái cây là mùi thơm kiểu citrus dễ chịu thoáng qua của quả chanh vàng, cùng với ngải giấm, một note hương xanh cổ điển nay đã khá ít gặp tại những mùi hương hiện đại.\r\n\r\nChắc hẳn, đây chính là cây đàn guitar tuyệt vời dành riên cho bạn, bất kể bạn là người mới học hay là người chơi đàn guitar có nhiều kinh nghiệm.', 1, 0),
(11, 'D&G-Light-Blue-Eau-Intense', '2890000', '2580000', '3b564df9d8.jpg', 1, '2021-12-07', 1, 10, 'Đánh bật đi những ngày hè nắng nóng bằng những hương thơm tươi mát, dịu ngọt của mình, Light Blue Eau Intense như chiếc thuyền đưa bạn thăm quan vùng biển Địa Trung Hải xinh đẹp và mát mẻ.\r\nCùng sự góp mặt của chuyên gia Olivier Cresp, chai nước hoa được ra mắt vào ngay thời điểm mùa hè năm 2017, nhờ vào chính những tầng hương nổi trội đầy tươi mắt cùng chiến lược “Đúng người, đúng thời điểm” mà Light Blue Eau Intense gặt hái được nhiều sự thành công và trở thành một trong những mùi hương phổ biến trong những ngày nóng, đặc biệt là ở Châu Á.', 1, 0),
(12, 'D&G-The-One', '2760000', '1790000', 'b583739361.jpg', 1, '2021-12-07', 1, 10, 'Chai nước hoa của hãng D&G có hỗn hợp mùi hương từ hạt rau mùi, rau húng quế và bưởi ở hương đầu. Tiếp đến ở tầng hương giữa đã tạo nên một làn hương thanh lịch và đầy khí chất mạnh mẽ có sự pha trộn giữa yếu tố ấm áp của gừng, tươi mát của hoa cam và nhẹ nhàng của bạch đậu khấu. Thuốc lá và hổ phách gợi cảm quyện cùng tuyết tùng rắn rỏi, mạnh mẽ làm nên một dấu ấn riêng của The One ở nốt hương cuối.\r\n\r\n', 1, 0),
(13, 'Dior-Sauvage', '3200000', '2980000', '37819c2fb3.jpg', 1, '2021-12-07', 6, 20, 'Chai nước hoa Dior này mang hương đầu tươi mát của cam begarmot, một chút nồng nàn của tiêu, tầng hương giữa mang nét gợi cảm và quyến rũ của các loài hoa phong lữ, hoa oải hương, tiêu hồng, tiêu Tứ Xuyên, cỏ Vertiver và cây Patchouli, chính tầng hương này làm nên điểm nhấn đặc biệt của Dior Sauvage Eau De Parfume. Hương cuối khép lại \"bản giao hưởng\" mùi hương này là những nốt hương mạnh mẽ của nhựa Ambroxan, Labdanum và ấm áp của hổ phách.', 1, 0),
(14, 'Lancome-Hypnose', '2600000', '2230000', '226afdfd97.jpg', 1, '2021-12-07', 5, 15, 'Hypnose của Lancome là một mùi hương theo hướng phương Đông đầy nắng, rừng với sắc thái sành điệu. Hương thơm nổi bật với hoa lạc tiên, tạo nên sự dịu dàng và nồng nàn của nữ giới. Sản phẩm kỳ diệu của hương hoa - vani có mùi thơm và ấm áp trên da và cỏ vetiver được bao quanh bởi hoa trắng và hoa nhài Sambac mang đến cảm giác gợi cảm và sâu lắng.', 1, 0),
(15, 'Lancome-La-Vie-Est-Belle-Flowers-Of-Happiness', '2900000', '2500000', 'afd10872d0.jpg', 1, '2021-12-07', 5, 8, 'Nước hoa Flowers Of Happiness mở ra hương thơm tươi mát từ quả bưởi và cam Bergamot. Tiếp đó là sự dịu dàng của “vườn hoa hạnh phúc” nhài, hồng, mẫu đơn và hoa lan chuông. Hương cuối là hỗn hợp xạ hương và gỗ đàn hương. Với hương thơm này của nhà Lancôme sẽ góp phần mang đến cho bạn nét ấm áp, quyến rũ và gợi cảm khó cưỡng.', 1, 6),
(16, 'Lancome-La-Nuit-Tresor', '3000000', '2700000', '6f261b34f3.jpg', 1, '2021-12-07', 5, 10, 'Mở ra những cảm xúc mới lạ cùng với sự thú vị khác biệt so với những sức hút bình thường, những tinh chất từ Quả lê, Cam bergamot, Quả quýt tuy quen thuộc nhưng đầy sự cuốn hút trong lần đầu chạm tới khứu giác đối phương. Những nốt hương tựa như một bông hồng đen tuyệt đẹp nhưng không kém phần gai góc, phảng phất từng đợt mạnh mẽ, ngọt ngào với Hoa phong lan Vanilla, Hoa hồng đen.\r\n\r\n', 1, 0),
(17, 'YSL-Libre', '3000000', '2760000', 'f5c6d5b426.jpg', 1, '2021-12-07', 15, 20, 'Mang đến hương vị nồng nàn, ấm áp và giúp cô nàng Yves Saint Laurent Libre EDP trở nên ngọt ngào và quyến rũ hơn, nhưng vẫn giữ được độ thanh lịch và tươi mới khi note hương cam vẫn hiện hữu. Sự sang trọng, gợi cảm và cá tính là điều hãng nước hoa YSL muốn gửi gắm đến cô nàng kiêu kỳ này.  \r\n\r\n', 1, 0),
(18, 'YSL-Mon-Paris', '3200000', '2550000', '162a8ca7f7.jpg', 1, '2021-12-07', 15, 5, 'YSL Mon Paris sở hữu một “kim tự tháp” hương thơm khá phức tạp với rất nhiều nguyên liệu tham gia vào cấu trúc tầng hương. Ngay từ những giây phút đầu tiên, các cô nàng sẽ lập tức bị “choáng ngợp” bởi mùi hương tươi trẻ, căng mọng đến từ vô số loại trái cây nổi tiếng. Vị chua nhẹ từ dâu tây, phúc bồn tử quyện cùng trái lê ngọt ngào, thanh mát tạo nên ấn tượng vô cùng êm dịu cho tầng top notes.', 1, 0),
(19, 'YSL-Y-Eau-De-Toilette', '2500000', '2000000', '320a2e8d02.jpg', 1, '2022-06-03', 15, 9, 'Là bức vẽ khắc họa lại vẻ đẹp đặc trưng của tuổi trẻ, Y - viết tắt cho \"Youth\" - đã khiến người dùng nhớ đến mình bởi tông hương trẻ trung và có phần nồng hậu của mình. Bởi sự năng động chính là sắc màu của tuổi trẻ, Y đã khéo léo bộc lộ nhiệt huyết của mình ngay trong tầng hương đầu với Chanh vàng, Cam bergamot và Bạc hà. Nhẹ nhàng và phóng khoáng.', 1, 3),
(20, 'YSL-Yves-Saint-Laurent', '3200000', '2950000', '9c64a23335.jpg', 1, '2022-06-03', 15, 19, 'Y Eau de Parfum Yves Saint Laurent hội tụ đầy đủ sự nam tính, mạnh mẽ của đàn ông, với áo khoác đen mỏng và áo thun trắng ở trong, gã Y còn sở hữu thêm sự trầm ấm, gần gũi của Đậu tonka và Gỗ tuyết tùng nữa, kết liễu mọi trái tim bởi sự điêu luyện đầy tinh quái của một kẻ trải đời với ngoại hình phong độ. Y Eau de Parfum Yves Saint Laurent là một quả táo xanh tươi mọng nước, và dĩ nhiên mọi cô gái đều muốn cắn một miếng để biết có ngon hay không, chỉ có điều chắc chắn sau cú cắn đầu tiên, chẳng có cô nàng nào đủ mạnh mẽ đặt trái táo xuống.', 1, 3),
(21, 'Dior Homme', '2900000', '2280000', '6fd082c91d.jpg', 1, '2022-06-11', 6, 5, 'Nước Hoa Dior Homme EDT 100ml là dòng nước hoa nam cao cấp được thiết kế dành riêng cho các quý ông từ thương hiệu Dior Pháp. Dior Homme ẩn chứa hương vị nồng nàn, ấm áp, giản dị nhưng tạo nên sức hút lôi cuốn, thể hiện được nét năng động, thanh lịch của nam giới.', 1, 0),
(22, 'CK Be Phân Tầng ', '995000', '770000', '4ac0f6817e.jpg', 1, '2022-06-11', 12, 12, 'Nước Hoa Calvin Klein CK Be 100ml Unisex màu đen là chai nước hoa Unisex mang lại sự tươi mát từ hương hoa cỏ thiên nhiên, thoang thoảng nhẹ nhàng trên da phù hợp với cả nam và nữ được yêu thích, đánh giá cao từ người dùng.', 1, 0),
(23, 'CK One Summer', '1100000', '770000', '01ce6abb63.jpg', 1, '2022-06-11', 12, 6, 'Được quảng bá là mùi hương sống động, trẻ trung và tươi mát của biển xanh, nắng vàng và gió biển, các thành phần hương chính của chai nước hoa gồm hương biển, trà xanh matcha, hương gỗ sẽ tạo nên một phong cách cực kỳ sản khoái và vô cùng phấn khích cho người dùng và sẽ lan tỏa cảm xúc tới người đứng cạch bạn.\r\n\r\nHương đầu: Hương nước.\r\nHương giữa: Trà.\r\nHương cuối: Gỗ Lũa.', 1, 0),
(24, 'Terre DHermes', '2900000', '2450000', '023c653575.jpg', 1, '2022-06-11', 7, 7, 'Nước hoa Hermes khởi đầu là hương cam và hương bưởi nhẹ nhàng, ngọt ngào. Tiếp đến là sự kết hợp của hương hạt tiêu và thiên trúc quỳ đầy quyến rũ của người đàn ông mạnh mẽ. Sau một vài giờ, những gì còn lại trên làn da sẽ là sự ấm áp, nhẹ nhàng của gỗ tuyết tùng, an tức hương, cỏ hương bài và cây hoắc hương.', 1, 0),
(25, ' Hermes LOmbre Des Merveilles', '2900000', '2450000', '16f84ddc49.jpg', 1, '2022-06-11', 7, 4, 'Nước hoa Hermes LOmbre des Merveilles Eau de Parfum rất đơn giản, không cầu kỳ. Mỗi tầng hương chỉ chứa đựng độc nhất một mùi hương. Nhưng chính sự giản đơn này làm nên nét độc đáo cho chai nước hoa.', 1, 0),
(26, 'Valentino Valentina Blush For Women', '2900000', '2640000', '3d25896c13.jpg', 1, '2022-06-11', 8, 6, 'Nhanh chóng luân chuyển các tầng hương tiếp theo của mình, từng tinh chất Hoa cam mang tới sự gợi cảm cuốn hút những người xung quanh. Hòa với nền Kẹo hạt dẻ và Vanilla ở những chặng cuối cùng, Valentina Blush EDP trải dài sự ngọt ngào lên khắp cơ thể bạn cho tới khi rời khỏi hẳn làn da sau khoảng thời gian dài tồn tại.\r\n\r\nMùi hương đặc trưng:\r\n\r\nHương đầu: Quả anh đào, Tiêu hồng\r\nHương giữa: Hoa cam\r\nHương cuối: Kẹo hạt dẻ, Vanilla', 1, 0),
(27, 'Gucci Bloom Ambrosia Di Fiori', '2870000', '2580000', '902081d746.jpg', 1, '2022-06-11', 4, 10, 'Trái tim của Gucci Bloom Ambrosia di Fiori EDP 100ml là Hoa Huệ, nhưng tinh khôi và tinh khiết bởi những cánh hoa Kim ngân bài trí lộng lẫy ở khắp sảnh điện. Sự huyền bí của Orris kết hợp cùng sự quyến rũ, ngọt ngào mộng mị của Hoa hồng Đan Mạch biến bữa tiệc trở nên sang trọng, tinh tế và gợi cảm đến bất ngờ. Chai nước hoa Ý này là mùi hương bất tử của các vị thần, là sự bất tử của vẻ đẹp xuân thì chẳng bao giờ phai mờ theo tháng năm. ', 1, 0),
(28, 'Versace Eros Pour Femme', '2050000', '2050000', 'bbc9711733.jpg', 1, '2022-06-11', 9, 7, 'Chai nước hoa Versace thuộc nhóm Floral Woody Musk (Hương hoa cỏ Gỗ-Xạ hương) hướng đến độ tuổi trên 25 tuổi. Các thành phần mùi hương để tạo nên hương thơm của Eros Pour Femme bắt đầu với chanh Sicilia, cam bergamot Calabria và thạch lựu, trái tim của Eros Pour Femme là hương chanh, hoa nhài Sambac, hoa nhài và hoa mẫu đơn. Hương cuối là sự kết hợp giữa gỗ đàn hương, ambrox, xạ hương. ', 1, 0),
(29, 'Coach Floral', '1380000', '1280000', 'd118a905c7.jpg', 1, '2022-06-11', 3, 4, 'Nàng thơ Coach Floral thu hút ánh nhìn của ta ngay từ cái nhìn đầu tiên với tầng hương thanh thoát, thuần túy của một vườn đầy cây trái với Dứa, Chanh vàng và Cam. Như tâm hồn của một cô gái vừa chớm nở, nhìn đời qua lăng kính màu hồng, Coach Floral ấp ủ làn hương hài hòa, đằm thắm từ các loài hoa, e ấp thể hiện sự tinh nghịch cùng chút bông đùa, trẻ trung với Hoa hồng, Nhài tây.', 1, 0),
(30, ' Mon Guerlain Intense', '2900000', '2500000', '2b281552a4.jpg', 1, '2022-06-11', 13, 3, 'Sự nữ tính, tươi mới của Nước hoa nữ Guerlain Mon Guerlain là hương Hoa nhài cùng sự gần gũi, ấm áp của Gỗ đàn hương biến Mon Guerlain trở thành cô nàng tự tin, thu hút mọi ánh nhìn bằng sự sang trọng và tinh tế.', 1, 0),
(31, 'LeLabo Santal 33', '6900000', '6500000', '7c5869c1e5.jpg', 1, '2022-06-11', 14, 12, 'Santal 33 là một bản tuyên ngôn cho sự sáng tạo bởi những nét chấm phá riêng biệt qua mùi hương ám khói, đặc biệt khơi dậy sự sống mãnh liệt của rừng già bạc ngàn với hàng niên kỷ.', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Normal');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `address` varchar(500) NOT NULL,
  `isConfirmed` tinyint(4) NOT NULL DEFAULT 0,
  `captcha` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `fullname`, `dob`, `password`, `role_id`, `status`, `address`, `isConfirmed`, `captcha`) VALUES
(1, 'admin@gmail.com', 'AdminFerfume', '2021-11-01', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, '', 1, ''),
(33, 'thaotrang201102@gmail.com', 'Nguyễn Thảo Trang', '2002-11-20', 'b0e80ddcacfb102b845db9c4e67ed821', 2, 1, 'uit,linh trung thủ đức', 0, '68388');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`userId`),
  ADD KEY `product_id` (`productId`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`userId`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`orderId`),
  ADD KEY `product_id` (`productId`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cate_id` (`cateId`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cateId`) REFERENCES `categories` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
