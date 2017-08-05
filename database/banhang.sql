-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 05, 2017 at 05:02 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `banhang`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `total` float DEFAULT NULL COMMENT 'tổng tiền',
  `payment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `id_customer`, `date_order`, `total`, `payment`, `note`, `created_at`, `updated_at`) VALUES
(14, 14, '2017-03-23', 160000, 'COD', 'k', '2017-03-23 04:46:05', '2017-03-23 04:46:05'),
(13, 13, '2017-03-21', 400000, 'ATM', 'Vui lòng giao hàng trước 5h', '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(15, 15, '2017-03-24', 220000, 'COD', 'e', '2017-03-24 07:14:32', '2017-03-24 07:14:32'),
(16, 22, '2017-07-19', 810000, 'COD', 'a', '2017-07-19 15:51:17', '2017-07-19 15:51:17'),
(17, 23, '2017-07-19', 810000, 'COD', 'a', '2017-07-19 15:55:09', '2017-07-19 15:55:09'),
(18, 24, '2017-07-19', 810000, 'COD', 'a', '2017-07-19 15:57:13', '2017-07-19 15:57:13'),
(19, 25, '2017-07-19', 810000, 'COD', 'a', '2017-07-19 16:01:27', '2017-07-19 16:01:27'),
(21, 27, '2017-07-22', 180000, 'COD', 'dasdasd', '2017-07-21 18:35:41', '2017-07-21 18:35:41');

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bill` int(10) NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(11) NOT NULL COMMENT 'số lượng',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `id_bill`, `id_product`, `quantity`, `created_at`, `updated_at`) VALUES
(18, 15, 62, 5, '2017-03-24 07:14:32', '2017-03-24 07:14:32'),
(17, 14, 2, 1, '2017-03-23 04:46:05', '2017-03-23 04:46:05'),
(16, 13, 60, 1, '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(15, 13, 59, 1, '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(14, 12, 60, 2, '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(13, 12, 61, 1, '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(12, 11, 61, 1, '2017-03-21 07:16:09', '2017-03-21 07:16:09'),
(11, 11, 57, 2, '2017-03-21 07:16:09', '2017-03-21 07:16:09'),
(19, 19, 2, 2, '2017-07-19 16:01:27', '2017-07-19 16:01:27'),
(20, 19, 1, 3, '2017-07-19 16:01:27', '2017-07-19 16:01:27'),
(21, 20, 60, 1, '2017-07-21 18:29:34', '2017-07-21 18:29:34'),
(22, 20, 23, 1, '2017-07-21 18:29:34', '2017-07-21 18:29:34'),
(23, 21, 19, 1, '2017-07-21 18:35:41', '2017-07-21 18:35:41'),
(24, 22, 60, 1, '2017-07-23 02:29:58', '2017-07-23 02:29:58'),
(25, 23, 60, 1, '2017-07-23 02:39:42', '2017-07-23 02:39:42');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `gender`, `email`, `address`, `phone_number`, `note`, `created_at`, `updated_at`) VALUES
(15, 'ê', 'Nữ', 'huongnguyen@gmail.com', 'e', 'e', 'e', '2017-03-24 07:14:32', '2017-03-24 07:14:32'),
(14, 'hhh', 'nam', 'huongnguyen@gmail.com', 'Lê thị riêng', '99999999999999999', 'k', '2017-03-23 04:46:05', '2017-03-23 04:46:05'),
(13, 'Hương Hương', 'Nữ', 'huongnguyenak96@gmail.com', 'Lê Thị Riêng, Quận 1', '23456789', 'Vui lòng giao hàng trước 5h', '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(12, 'Khoa phạm', 'Nam', 'khoapham@gmail.com', 'Lê thị riêng', '1234567890', 'Vui lòng chuyển đúng hạn', '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(11, 'Hương Hương', 'Nữ', 'huongnguyenak96@gmail.com', 'Lê Thị Riêng, Quận 1', '234567890-', 'không chú', '2017-03-21 07:16:09', '2017-03-21 07:16:09'),
(16, 'admin', 'admin', 'admin@mail.com', 'a', '123', 'a', '2017-07-19 15:30:35', '2017-07-19 15:30:35'),
(17, 'a', 'a', 'admin@mail.com', 'a', '123', '2323', '2017-07-19 15:38:42', '2017-07-19 15:38:42'),
(18, 'b', 'b', 'abc@gmail.com', 'ac', 'a', 'a', '2017-07-19 15:40:42', '2017-07-19 15:40:42'),
(19, 'admin', 'admin', 'admin1@mail.com', '12', 'a', 'a', '2017-07-19 15:41:40', '2017-07-19 15:41:40'),
(20, 'a', 'a', 'abc@gmail.com', 'a', '123', 'a', '2017-07-19 15:47:55', '2017-07-19 15:47:55'),
(21, 'a', 'a', 'abc@gmail.com', 'a', '123', 'a', '2017-07-19 15:48:59', '2017-07-19 15:48:59'),
(22, 'a', 'a', 'admin1@mail.com', 'a', '123', 'a', '2017-07-19 15:51:17', '2017-07-19 15:51:17'),
(23, 'a', 'a', 'admin1@mail.com', 'a', '123', 'a', '2017-07-19 15:55:09', '2017-07-19 15:55:09'),
(24, 'a', 'a', 'admin@mail.com', 'a', '123', 'a', '2017-07-19 15:57:13', '2017-07-19 15:57:13'),
(25, 'a', 'a', 'admin@mail.com', 'a', '123', 'a', '2017-07-19 16:01:27', '2017-07-19 16:01:27'),
(26, 'nguyen huy luu', 'nam', 'luunguyen@mail.com', 'ha noi', '01637426093', 'giao hang nhanh chong', '2017-07-21 18:29:34', '2017-07-21 18:29:34'),
(27, 'nguyễn huy lưu', 'nam', 'abc@gmail.com', 'ha noi', '123', 'dasdasd', '2017-07-21 18:35:41', '2017-07-21 18:35:41'),
(28, 'sdasd', 'nam', 'admin@mail.com', 'qwqw', '1212', 'asasdasd', '2017-07-23 02:29:58', '2017-07-23 02:29:58'),
(29, 'sdasd', 'nam', 'ac@gmail.com', 'adasd', '123', 'adsdasd', '2017-07-23 02:39:42', '2017-07-23 02:39:42');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(10) NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'tiêu đề',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'nội dung',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'hình',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `image`, `create_at`, `update_at`) VALUES
(1, 'Mùa trung thu năm nay, Hỷ Lâm Môn muốn gửi đến quý khách hàng sản phẩm mới xuất hiện lần đầu tiên tại Việt nam "Bánh trung thu Bơ Sữa HongKong".', 'Những ý tưởng dưới đây sẽ giúp bạn sắp xếp tủ quần áo trong phòng ngủ chật hẹp của mình một cách dễ dàng và hiệu quả nhất. ', 'sample1.jpg', '2017-03-11 06:20:23', '0000-00-00 00:00:00'),
(2, 'Tư vấn cải tạo phòng ngủ nhỏ sao cho thoải mái và thoáng mát', 'Chúng tôi sẽ tư vấn cải tạo và bố trí nội thất để giúp phòng ngủ của chàng trai độc thân thật thoải mái, thoáng mát và sáng sủa nhất. ', 'sample2.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(3, 'Đồ gỗ nội thất và nhu cầu, xu hướng sử dụng của người dùng', 'Đồ gỗ nội thất ngày càng được sử dụng phổ biến nhờ vào hiệu quả mà nó mang lại cho không gian kiến trúc. Xu thế của các gia đình hiện nay là muốn đem thiên nhiên vào nhà ', 'sample3.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(4, 'Hướng dẫn sử dụng bảo quản đồ gỗ, nội thất.', 'Ngày nay, xu hướng chọn vật dụng làm bằng gỗ để trang trí, sử dụng trong văn phòng, gia đình được nhiều người ưa chuộng và quan tâm. Trên thị trường có nhiều sản phẩm mẫu ', 'sample4.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(5, 'Phong cách mới trong sử dụng đồ gỗ nội thất gia đình', 'Đồ gỗ nội thất gia đình ngày càng được sử dụng phổ biến nhờ vào hiệu quả mà nó mang lại cho không gian kiến trúc. Phong cách sử dụng đồ gỗ hiện nay của các gia đình hầu h ', 'sample5.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_type` int(10) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `unit_price` float DEFAULT NULL,
  `promotion_price` float DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_hot` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tag` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `id_type`, `description`, `unit_price`, `promotion_price`, `image`, `unit`, `product_hot`, `created_at`, `updated_at`, `tag`) VALUES
(1, 'bánh kem sầu riêng', 5, '<p>bánh có hương vị của kem</p>', 180000, 120000, 'kO5G_cupcake.jpg', 'hộp', 1, '2016-10-26 03:00:16', '2017-07-21 07:36:41', 'banh-kem-sau-rieng'),
(2, 'Bánh Crepe Chocolate', 6, '<p>bánh có hương vị kem</p>', 180000, 120000, 'crepe-chocolate.jpg', 'hộp', 1, '2016-10-26 03:00:16', '2017-07-21 03:25:49', 'banh-crepe-chocolate'),
(3, 'Bánh Crepe Sầu riêng - Chuối', 5, '<p>bánh có hương vị kem</p>', 180000, 120000, 'crepe-chuoi.jpg', 'hộp', 0, '2016-10-26 03:00:16', '2017-07-21 07:01:15', 'banh-crepe-sau-rieng-chuoi'),
(4, 'Bánh Crepe Đào', 5, '<p>Thưởng thức macaron, người ta có thể tìm thấy từ những hương vị truyền thống như mâm xôi, chocolate, cho đến những hương vị mới như nấm và trà xanh. Macaron với vị giòn tan của vỏ bánh, béo ngậy ngọt ngào của phần nhân, với vẻ ngoài đáng yêu và nhiều màu sắc đẹp mắt, đây là món bạn không nên bỏ qua khi khám phá nền ẩm thực Pháp.</p>', 180000, 0, 'crepe-dao.jpg', 'hộp', 0, '2016-10-26 03:00:16', '2017-07-21 03:28:19', 'banh-crepe-dao'),
(5, 'Bánh Crepe Dâu', 5, '<p>Thưởng thức macaron, người ta có thể tìm thấy từ những hương vị truyền thống như mâm xôi, chocolate, cho đến những hương vị mới như nấm và trà xanh. Macaron với vị giòn tan của vỏ bánh, béo ngậy ngọt ngào của phần nhân, với vẻ ngoài đáng yêu và nhiều màu sắc đẹp mắt, đây là món bạn không nên bỏ qua khi khám phá nền ẩm thực Pháp.</p>', 180000, 120000, 'crepedau.jpg', 'hộp', 0, '2016-10-26 03:00:16', '2017-07-21 03:29:46', 'banh-crepe-dau'),
(6, 'Bánh Crepe Pháp', 5, NULL, 180000, 120000, 'crepe-phap.jpg', 'hộp', 0, '2016-10-26 03:00:16', '2017-07-21 03:29:54', 'banh-crepe-phap'),
(7, 'Bánh Crepe Táo', 5, NULL, 180000, 0, 'crepe-tao.jpg', 'hộp', 1, '2016-10-26 03:00:16', '2017-07-21 03:30:06', 'banh-crepe-tao'),
(8, 'Bánh Crepe Trà xanh', 5, '<p>bánh có hương vị kem</p>', 180000, 120000, 'crepe-traxanh.jpg', 'hộp', 0, '2016-10-26 03:00:16', '2017-07-21 03:30:30', 'banh-crepe-tra-xanh'),
(9, 'Bánh Crepe Sầu riêng và Dứa', 5, NULL, 180000, 120000, 'saurieng-dua.jpg', 'hộp', 0, '2016-10-26 03:00:16', '2017-07-21 03:31:07', 'banh-crepe-sau-rieng-va-dua'),
(11, 'Bánh Gato Trái cây Việt Quất', 3, '<p>bánh có hương vị kem</p>', 180000, 0, '544bc48782741.png', 'cái', 0, '2016-10-12 02:00:00', '2017-07-21 03:31:22', 'banh-gato-trai-cay-viet-quat'),
(12, 'Bánh sinh nhật rau câu trái cây', 3, '<p>bánh có hương vị kem</p>', 180000, 120000, '210215-banh-sinh-nhat-rau-cau-body- (6).jpg', 'cái', 0, '2016-10-12 02:00:00', '2017-07-21 03:31:32', 'banh-sinh-nhat-rau-cau-trai-cay'),
(13, 'Bánh kem Chocolate Dâu', 3, '<p>bánh có hương vị kem</p>', 180000, 0, 'banh kem sinh nhat.jpg', 'cái', 1, '2016-10-12 02:00:00', '2017-07-21 03:31:43', 'banh-kem-chocolate-dau'),
(14, 'Bánh kem Dâu III', 3, NULL, 180000, 120000, 'Banh-kem (6).jpg', 'cái', 0, '2016-10-12 02:00:00', '2017-07-21 03:31:54', 'banh-kem-dau-iii'),
(15, 'Bánh kem Dâu I', 3, '<p>bánh có hương vị kem</p>', 180000, 120000, 'banhkem-dau.jpg', 'cái', 1, '2016-10-12 02:00:00', '2017-07-21 03:32:05', 'banh-kem-dau-i'),
(16, 'Bánh trái cây II', 3, '<p>bánh có hương vị kem</p>', 180000, 120000, 'banhtraicay.jpg', 'hộp', 0, '2016-10-12 02:00:00', '2017-07-21 03:33:55', 'banh-trai-cay-ii'),
(17, 'Apple Cake', 3, '<p>bánh có hương vị kem</p>', 180000, 120000, 'Fruit-Cake_7979.jpg', 'cai', 0, '2016-10-12 02:00:00', '2017-07-21 03:34:14', 'apple-cake'),
(18, 'Bánh ngọt nhân cream táo', 2, '<p>bánh có hương vị kem</p>', 180000, 0, '20131108144733.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2017-07-21 03:34:26', 'banh-ngot-nhan-cream-tao'),
(19, 'Bánh Chocolate Trái cây', 2, '<p>bánh có hương vị kem</p>', 180000, 120000, 'Fruit-Cake_7976.jpg', 'hộp', 1, '2016-10-13 02:20:00', '2017-07-21 03:34:36', 'banh-chocolate-trai-cay'),
(20, 'Bánh Chocolate Trái cây II', 2, '<p>bánh có hương vị kem</p>', 180000, 0, 'Fruit-Cake_7981.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2017-07-21 03:35:11', 'banh-chocolate-trai-cay-ii'),
(21, 'Peach Cake', 2, '<p>bánh có hương vị kem</p>', 180000, 120000, 'Peach-Cake_3294.jpg', 'cái', 0, '2016-10-13 02:20:00', '2017-07-21 03:35:26', 'peach-cake'),
(22, 'Bánh bông lan trứng muối I', 1, '<p>bánh có hương vị kem</p>', 180000, 120000, 'banhbonglantrung.jpg', 'hộp', 1, '2016-10-13 02:20:00', '2017-07-21 03:35:36', 'banh-bong-lan-trung-muoi-i'),
(23, 'Bánh bông lan trứng muối II', 1, '<p>bánh có hương vị kem</p>', 180000, 120000, 'banhbonglantrungmuoi.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2017-07-21 03:35:46', 'banh-bong-lan-trung-muoi-ii'),
(24, 'Bánh French', 1, '<p>bánh có hương vị kem</p>', 180000, 0, 'banh-man-thu-vi-nhat-1.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2017-07-21 03:35:55', 'banh-french'),
(25, 'Bánh mì Australia', 1, '<p>bánh có hương vị kem</p>', NULL, NULL, 'dung-khoai-tay-lam-banh-gato-man-cuc-ngon.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2017-07-21 03:10:13', 'banh-mi-australia'),
(26, 'Bánh mặn thập cẩm', 1, '<p>bánh có hương vị kem</p>', 180000, 120000, 'Fruit-Cake.png', 'hộp', 0, '2016-10-13 02:20:00', '2017-07-21 03:36:06', 'banh-man-thap-cam'),
(27, 'Bánh Muffins trứng', 1, '<p>bánh có hương vị kem</p>', 180000, 120000, 'maxresdefault.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2017-07-21 03:36:21', 'banh-muffins-trung'),
(28, 'Bánh Scone Peach Cake', 1, '<p>bánh có hương vị kem</p>', 180000, 120000, 'Peach-Cake_3300.jpg', 'hộp', 1, '2016-10-13 02:20:00', '2017-07-21 03:36:34', 'banh-scone-peach-cake'),
(29, 'Bánh mì Loaf I', 1, '<p>bánh có hương vị kem</p>', 180000, 0, 'sli12.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2017-07-21 03:36:42', 'banh-mi-loaf-i'),
(30, 'Bánh kem Chocolate Dâu I', 4, '<p>bánh có hương vị kem</p>', 180000, 120000, 'sli12.jpg', 'cái', 1, '2016-10-13 02:20:00', '2017-07-21 03:36:52', 'banh-kem-chocolate-dau-i'),
(31, 'Bánh kem Trái cây I', 4, '<p>bánh có hương vị kem</p>', 180000, 120000, 'Fruit-Cake.jpg', 'cái', 0, '2016-10-13 02:20:00', '2017-07-21 03:37:01', 'banh-kem-trai-cay-i'),
(32, 'Bánh kem Trái cây II', 4, '<p>bánh có hương vị kem</p>', 180000, 0, 'Fruit-Cake_7971.jpg', 'cái', 0, '2016-10-13 02:20:00', '2017-07-21 03:37:11', 'banh-kem-trai-cay-ii'),
(33, 'Bánh kem Doraemon', 4, '<p>bánh có hương vị kem</p>', 180000, 120000, 'p1392962167_banh74.jpg', 'cái', 1, '2016-10-13 02:20:00', '2017-07-21 03:37:23', 'banh-kem-doraemon'),
(34, 'Bánh kem Caramen Pudding', 4, '<p>bánh có hương vị kem</p>', 180000, 120000, 'Caramen-pudding636099031482099583.jpg', 'cái', 1, '2016-10-13 02:20:00', '2017-07-21 03:37:32', 'banh-kem-caramen-pudding'),
(35, 'Bánh kem Chocolate Fruit', 4, '<p>bánh có hương vị kem</p>', 180000, 120000, 'chocolate-fruit636098975917921990.jpg', 'cái', 1, '2016-10-13 02:20:00', '2017-07-21 03:37:48', 'banh-kem-chocolate-fruit'),
(36, 'Bánh kem Coffee Chocolate GH6', 4, '<p>bánh có hương vị kem</p>', 180000, 120000, 'COFFE-CHOCOLATE636098977566220885.jpg', 'cái', 0, '2016-10-13 02:20:00', '2017-07-21 03:37:59', 'banh-kem-coffee-chocolate-gh6'),
(37, 'Bánh kem Mango Mouse', 4, '<p>bánh có hương vị kem</p>', 180000, 120000, 'mango-mousse-cake.jpg', 'cái', 1, '2016-10-13 02:20:00', '2017-07-21 03:38:08', 'banh-kem-mango-mouse'),
(38, 'Bánh kem Matcha Mouse', 4, '<p>bánh có hương vị kem</p>', 180000, 0, 'MATCHA-MOUSSE.jpg', 'cái', 0, '2016-10-13 02:20:00', '2017-07-21 03:38:17', 'banh-kem-matcha-mouse'),
(39, 'Bánh kem Flower Fruit', 4, '<p>bánh có hương vị kem</p>', 180000, 120000, 'flower-fruits636102461981788938.jpg', 'cái', 0, '2016-10-13 02:20:00', '2017-07-21 03:38:27', 'banh-kem-flower-fruit'),
(40, 'Bánh kem Strawberry Delight', 4, '<p>bánh có hương vị kem</p>', 180000, 120000, 'strawberry-delight636102445035635173.jpg', 'cái', 0, '2016-10-13 02:20:00', '2017-07-21 03:38:36', 'banh-kem-strawberry-delight'),
(41, 'Bánh kem Raspberry Delight', 4, '<p>bánh có hương vị kem</p>', 180000, 120000, 'raspberry.jpg', 'cái', 0, '2016-10-13 02:20:00', '2017-07-21 03:38:45', 'banh-kem-raspberry-delight'),
(42, 'Beefy Pizza', 6, '<p>Thịt bò xay, ngô, sốt BBQ, phô mai mozzarella</p>', 180000, 120000, '40819_food_pizza.jpg', 'cái', 0, '2016-10-13 02:20:00', '2017-07-21 03:38:55', 'beefy-pizza'),
(43, 'Hawaii Pizza', 6, '<p>Sốt cà chua, ham , dứa, pho mai mozzarella</p>', 180000, 0, 'hawaiian paradise_large-900x900.jpg', 'cái', 1, '2016-10-13 02:20:00', '2017-07-21 03:39:04', 'hawaii-pizza'),
(44, 'Smoke Chicken Pizza', 6, '<p>Gà hun khói,nấm, sốt cà chua, pho mai mozzarella.</p>', 180000, 120000, 'chicken black pepper_large-900x900.jpg', 'cái', 0, '2016-10-13 02:20:00', '2017-07-21 03:39:16', 'smoke-chicken-pizza'),
(45, 'Sausage Pizza', 6, '<p>Xúc xích klobasa, Nấm, Ngô, sốtcà chua, pho mai Mozzarella.</p>', 180000, 120000, 'pizza-miami.jpg', 'cái', 0, '2016-10-13 02:20:00', '2017-07-21 03:39:31', 'sausage-pizza'),
(46, 'Ocean Pizza', 6, '<p>Tôm , mực, xào cay,ớt xanh, hành tây, cà chua, phomai mozzarella.</p>', 180000, 120000, 'seafood curry_large-900x900.jpg', 'cái', 0, '2016-10-13 02:20:00', '2017-07-21 03:39:44', 'ocean-pizza'),
(47, 'All Meaty Pizza', 6, '<p>Ham, bacon, chorizo, pho mai mozzarella.</p>', 180000, 120000, 'all1).jpg', 'cái', 0, '2016-10-13 02:20:00', '2017-07-21 03:39:56', 'all-meaty-pizza'),
(48, 'Tuna Pizza', 6, '<p>Cá Ngừ, sốt Mayonnaise,sốt càchua, hành tây, pho mai Mozzarella</p>', 180000, 0, '54eaf93713081_-_07-germany-tuna.jpg', 'cái', 0, '2016-10-13 02:20:00', '2017-07-21 03:40:06', 'tuna-pizza'),
(49, 'Bánh su kem nhân dừa', 7, '<p>bánh có hương vị kem</p>', 180000, 0, 'maxresdefault.jpg', 'cái', 0, '2016-10-13 02:20:00', '2017-07-21 03:42:38', 'banh-su-kem-nhan-dua'),
(50, 'Bánh su kem sữa tươi', 7, '<p>bánh có hương vị kem</p>', 180000, 0, 'sukem.jpg', 'cái', 0, '2016-10-13 02:20:00', '2017-07-21 03:43:05', 'banh-su-kem-sua-tuoi'),
(51, 'Bánh su kem sữa tươi chiên giòn', 7, '<p>bánh có hương vị kem</p>', 180000, 120000, '1434429117-banh-su-kem-chien-20.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2017-07-21 03:43:15', 'banh-su-kem-sua-tuoi-chien-gion'),
(52, 'Bánh su kem dâu sữa tươi', 7, '<p>bánh có hương vị kem</p>', 180000, 0, 'sukemdau.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2017-07-21 03:43:26', 'banh-su-kem-dau-sua-tuoi'),
(53, 'Bánh su kem bơ sữa tươi', 7, '<p>Thưởng thức macaron, người ta có thể tìm thấy từ những hương vị truyền thống như mâm xôi, chocolate, cho đến những hương vị mới như nấm và trà xanh. Macaron với vị giòn tan của vỏ bánh, béo ngậy ngọt ngào của phần nhân, với vẻ ngoài đáng yêu và nhiều màu sắc đẹp mắt, đây là món bạn không nên bỏ qua khi khám phá nền ẩm thực Pháp.</p>', 180000, 120000, 'He-Thong-Banh-Su-Singapore-Chewy-Junior.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2017-07-21 03:43:37', 'banh-su-kem-bo-sua-tuoi'),
(54, 'Bánh su kem nhân trái cây sữa tươi', 7, '<p>Thưởng thức macaron, người ta có thể tìm thấy từ những hương vị truyền thống như mâm xôi, chocolate, cho đến những hương vị mới như nấm và trà xanh. Macaron với vị giòn tan của vỏ bánh, béo ngậy ngọt ngào của phần nhân, với vẻ ngoài đáng yêu và nhiều màu sắc đẹp mắt, đây là món bạn không nên bỏ qua khi khám phá nền ẩm thực Pháp.</p>', 180000, 120000, 'foody-banh-su-que-635930347896369908.jpg', 'hộp', 1, '2016-10-13 02:20:00', '2017-07-21 03:43:47', 'banh-su-kem-nhan-trai-cay-sua-tuoi'),
(55, 'Bánh su kem cà phê', 7, '<p>Thưởng thức macaron, người ta có thể tìm thấy từ những hương vị truyền thống như mâm xôi, chocolate, cho đến những hương vị mới như nấm và trà xanh. Macaron với vị giòn tan của vỏ bánh, béo ngậy ngọt ngào của phần nhân, với vẻ ngoài đáng yêu và nhiều màu sắc đẹp mắt, đây là món bạn không nên bỏ qua khi khám phá nền ẩm thực Pháp.</p>', 180000, 120000, 'banh-su-kem-ca-phe-1.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2017-07-21 03:43:57', 'banh-su-kem-ca-phe'),
(56, 'Bánh su kem phô mai', 7, '<p>Thưởng thức macaron, người ta có thể tìm thấy từ những hương vị truyền thống như mâm xôi, chocolate, cho đến những hương vị mới như nấm và trà xanh. Macaron với vị giòn tan của vỏ bánh, béo ngậy ngọt ngào của phần nhân, với vẻ ngoài đáng yêu và nhiều màu sắc đẹp mắt, đây là món bạn không nên bỏ qua khi khám phá nền ẩm thực Pháp.</p>', 180000, 120000, '50020041-combo-20-banh-su-que-pho-mai-9.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2017-07-21 03:44:07', 'banh-su-kem-pho-mai'),
(57, 'Bánh su kem sữa tươi chocolate', 7, '<p>Thưởng thức macaron, người ta có thể tìm thấy từ những hương vị truyền thống như mâm xôi, chocolate, cho đến những hương vị mới như nấm và trà xanh. Macaron với vị giòn tan của vỏ bánh, béo ngậy ngọt ngào của phần nhân, với vẻ ngoài đáng yêu và nhiều màu sắc đẹp mắt, đây là món bạn không nên bỏ qua khi khám phá nền ẩm thực Pháp.</p>', 180000, 120000, 'combo-20-banh-su-que-kem-sua-tuoi-phu-socola.jpg', 'hộp', 1, '2016-10-13 02:20:00', '2017-07-21 03:44:23', 'banh-su-kem-sua-tuoi-chocolate'),
(58, 'Bánh Macaron Pháp', 2, '<p>Thưởng thức macaron, người ta có thể tìm thấy từ những hương vị truyền thống như mâm xôi, chocolate, cho đến những hương vị mới như nấm và trà xanh. Macaron với vị giòn tan của vỏ bánh, béo ngậy ngọt ngào của phần nhân, với vẻ ngoài đáng yêu và nhiều màu sắc đẹp mắt, đây là món bạn không nên bỏ qua khi khám phá nền ẩm thực Pháp.</p>', 180000, 0, 'Macaron9.jpg', 'hộp', 0, '2016-10-26 17:00:00', '2017-07-21 03:44:33', 'banh-macaron-phap'),
(59, 'Bánh Tiramisu - Italia', 2, '<p>Chỉ cần cắn một miếng, bạn sẽ cảm nhận được tất cả các hương vị đó hòa quyện cùng một chính vì thế người ta còn ví món bánh này là Thiên đường trong miệng của bạn</p>', 180000, 0, '234.jpg', 'hộp', 0, '2016-10-26 17:00:00', '2017-07-21 03:44:42', 'banh-tiramisu-italia'),
(60, 'Bánh Táo - Mỹ', 2, '<p>Bánh táo Mỹ với phần vỏ bánh mỏng, giòn mềm, ẩn chứa phần nhân táo thơm ngọt, điểm chút vị chua dịu của trái cây quả sẽ là một lựa chọn hoàn hảo cho những tín đồ bánh ngọt trên toàn thế giới.</p>', 180000, 120000, '1234.jpg', 'hộp', 0, '2016-10-26 17:00:00', '2017-07-21 03:44:53', 'banh-tao-my'),
(61, 'Bánh Cupcake - Anh Quốc', 6, '<p>Những chiếc cupcake có cấu tạo gồm phần vỏ bánh xốp mịn và phần kem trang trí bên trên rất bắt mắt với nhiều hình dạng và màu sắc khác nhau. Cupcake còn được cho là chiếc bánh mang lại niềm vui và tiếng cười như chính hình dáng đáng yêu của chúng.</p>', 180000, 120000, 'cupcake.jpg', 'cái', 1, NULL, '2017-07-21 03:45:06', 'banh-cupcake-anh-quoc');

-- --------------------------------------------------------

--
-- Table structure for table `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slide`
--

INSERT INTO `slide` (`id`, `link`, `image`) VALUES
(1, '', 'banner1.jpg'),
(2, '', 'banner2.jpg'),
(3, '', 'banner3.jpg'),
(4, '', 'banner4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `type_products`
--

CREATE TABLE `type_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tag` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `type_products`
--

INSERT INTO `type_products` (`id`, `name`, `created_at`, `updated_at`, `tag`) VALUES
(1, 'Bánh mặn', NULL, '2017-07-20 14:58:18', 'banh-man'),
(2, 'Bánh ngọt', '2016-10-12 02:16:15', '2017-07-20 14:40:15', 'banh-ngot'),
(3, 'Bánh trái cây', '2016-10-18 00:33:33', '2017-07-20 14:42:15', 'banh-trai-cay'),
(4, 'Bánh kem', '2016-10-26 03:29:19', '2017-07-20 14:45:26', 'banh-kem'),
(5, 'Bánh crepe', '2016-10-28 04:00:00', '2017-07-20 14:47:01', 'banh-crepe'),
(6, 'Bánh Pizza', '2016-10-25 17:19:00', '2017-07-20 14:47:08', 'banh-pizza'),
(7, 'Bánh su kem', '2016-10-25 17:19:00', '2017-07-20 14:47:13', 'banh-su-kem');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(7, 'nguyễn văn A', 'admin@gmail.com', '$2y$10$cbkT1MFph7ApYwcqOkbmfeQV2fKvYkLIQYNWwNmxOu1Lcomi6cPUa', '2017-07-19 17:00:00', '2017-07-20 17:00:00'),
(8, 'nguyễn văn E', 'admin1@gmail.com', '$2y$10$ImmSLAmkFIrepzQe1MwrHOV4poKmqplbJdWrZdgnj8Ss2/3v5Q6fK', '2017-07-18 17:00:00', '2017-07-21 12:09:25'),
(9, 'nguyễn văn c', 'admin3@gmail.com', '$2y$10$cbkT1MFph7ApYwcqOkbmfeQV2fKvYkLIQYNWwNmxOu1Lcomi6cPUa', '2017-07-25 17:00:00', '2017-07-11 17:00:00'),
(10, 'admin4', 'admin4@gmail.com', '$2y$10$cbkT1MFph7ApYwcqOkbmfeQV2fKvYkLIQYNWwNmxOu1Lcomi6cPUa', '2017-07-23 17:00:00', '2017-07-17 17:00:00'),
(13, 'admin', 'abc@gmail.com', '$2y$10$oKbQ610X4Mah4Qu3sbdk2u9b/MZjgmAj.H19aL19dlXCzmIZEdJrO', '2017-07-21 14:51:53', '2017-07-21 14:51:53'),
(14, 'admin', 'admin@mail.com', '$2y$10$6zEoKP48ssMm0IuMm6qaC.kmkB9X3WtpUZ81hBq7TkTRjPBOXo6IO', '2017-07-21 14:52:52', '2017-07-21 14:52:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_ibfk_1` (`id_customer`);

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_detail_ibfk_2` (`id_product`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id_type_foreign` (`id_type`);

--
-- Indexes for table `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT for table `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `type_products`
--
ALTER TABLE `type_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_id_type_foreign` FOREIGN KEY (`id_type`) REFERENCES `type_products` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
