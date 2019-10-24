-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 22, 2019 at 11:26 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bdonor`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_userpermission`
--

CREATE TABLE `accounts_userpermission` (
  `id` int(11) NOT NULL,
  `can_browse` tinyint(1) NOT NULL,
  `can_donate` tinyint(1) NOT NULL,
  `can_ask_for_a_donor` tinyint(1) NOT NULL,
  `can_manage_bank` tinyint(1) NOT NULL,
  `can_chat` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_userprofile`
--

CREATE TABLE `accounts_userprofile` (
  `id` int(11) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `account_type` smallint(5) UNSIGNED NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `blood_group` varchar(10) NOT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(2) DEFAULT NULL,
  `about` longtext DEFAULT NULL,
  `facebook` varchar(300) DEFAULT NULL,
  `linkedin` varchar(300) DEFAULT NULL,
  `website` varchar(300) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_userreport`
--

CREATE TABLE `accounts_userreport` (
  `id` int(11) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `category` varchar(100) NOT NULL,
  `details` longtext DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reported_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_userstripe`
--

CREATE TABLE `accounts_userstripe` (
  `id` int(11) NOT NULL,
  `stripe_id` varchar(200) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `account_emailaddress`
--

CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL,
  `email` varchar(190) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `account_emailconfirmation`
--

CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add site', 7, 'add_site'),
(26, 'Can change site', 7, 'change_site'),
(27, 'Can delete site', 7, 'delete_site'),
(28, 'Can view site', 7, 'view_site'),
(29, 'Can add email address', 8, 'add_emailaddress'),
(30, 'Can change email address', 8, 'change_emailaddress'),
(31, 'Can delete email address', 8, 'delete_emailaddress'),
(32, 'Can view email address', 8, 'view_emailaddress'),
(33, 'Can add email confirmation', 9, 'add_emailconfirmation'),
(34, 'Can change email confirmation', 9, 'change_emailconfirmation'),
(35, 'Can delete email confirmation', 9, 'delete_emailconfirmation'),
(36, 'Can view email confirmation', 9, 'view_emailconfirmation'),
(37, 'Can add social account', 10, 'add_socialaccount'),
(38, 'Can change social account', 10, 'change_socialaccount'),
(39, 'Can delete social account', 10, 'delete_socialaccount'),
(40, 'Can view social account', 10, 'view_socialaccount'),
(41, 'Can add social application', 11, 'add_socialapp'),
(42, 'Can change social application', 11, 'change_socialapp'),
(43, 'Can delete social application', 11, 'delete_socialapp'),
(44, 'Can view social application', 11, 'view_socialapp'),
(45, 'Can add social application token', 12, 'add_socialtoken'),
(46, 'Can change social application token', 12, 'change_socialtoken'),
(47, 'Can delete social application token', 12, 'delete_socialtoken'),
(48, 'Can view social application token', 12, 'view_socialtoken'),
(49, 'Can add User Stripe', 13, 'add_userstripe'),
(50, 'Can change User Stripe', 13, 'change_userstripe'),
(51, 'Can delete User Stripe', 13, 'delete_userstripe'),
(52, 'Can view User Stripe', 13, 'view_userstripe'),
(53, 'Can add User Profile', 14, 'add_userprofile'),
(54, 'Can change User Profile', 14, 'change_userprofile'),
(55, 'Can delete User Profile', 14, 'delete_userprofile'),
(56, 'Can view User Profile', 14, 'view_userprofile'),
(57, 'Can add User Report', 15, 'add_userreport'),
(58, 'Can change User Report', 15, 'change_userreport'),
(59, 'Can delete User Report', 15, 'delete_userreport'),
(60, 'Can view User Report', 15, 'view_userreport'),
(61, 'Can add User Permission', 16, 'add_userpermission'),
(62, 'Can change User Permission', 16, 'change_userpermission'),
(63, 'Can delete User Permission', 16, 'delete_userpermission'),
(64, 'Can view User Permission', 16, 'view_userpermission'),
(65, 'Can add Site Preference', 17, 'add_sitepreference'),
(66, 'Can change Site Preference', 17, 'change_sitepreference'),
(67, 'Can delete Site Preference', 17, 'delete_sitepreference'),
(68, 'Can view Site Preference', 17, 'view_sitepreference'),
(69, 'Can add Notification', 18, 'add_notification'),
(70, 'Can change Notification', 18, 'change_notification'),
(71, 'Can delete Notification', 18, 'delete_notification'),
(72, 'Can view Notification', 18, 'view_notification'),
(73, 'Can add Location', 19, 'add_location'),
(74, 'Can change Location', 19, 'change_location'),
(75, 'Can delete Location', 19, 'delete_location'),
(76, 'Can view Location', 19, 'view_location'),
(77, 'Can add Suspicious User', 20, 'add_suspicious'),
(78, 'Can change Suspicious User', 20, 'change_suspicious'),
(79, 'Can delete Suspicious User', 20, 'delete_suspicious'),
(80, 'Can view Suspicious User', 20, 'view_suspicious'),
(81, 'Can add thread', 21, 'add_thread'),
(82, 'Can change thread', 21, 'change_thread'),
(83, 'Can delete thread', 21, 'delete_thread'),
(84, 'Can view thread', 21, 'view_thread'),
(85, 'Can add Chat Message', 22, 'add_chatmessage'),
(86, 'Can change Chat Message', 22, 'change_chatmessage'),
(87, 'Can delete Chat Message', 22, 'delete_chatmessage'),
(88, 'Can view Chat Message', 22, 'view_chatmessage'),
(89, 'Can add Donation', 23, 'add_donation'),
(90, 'Can change Donation', 23, 'change_donation'),
(91, 'Can delete Donation', 23, 'delete_donation'),
(92, 'Can view Donation', 23, 'view_donation'),
(93, 'Can add Donation Util', 24, 'add_donationutil'),
(94, 'Can change Donation Util', 24, 'change_donationutil'),
(95, 'Can delete Donation Util', 24, 'delete_donationutil'),
(96, 'Can view Donation Util', 24, 'view_donationutil'),
(97, 'Can add Donation Respond', 25, 'add_donationrespond'),
(98, 'Can change Donation Respond', 25, 'change_donationrespond'),
(99, 'Can delete Donation Respond', 25, 'delete_donationrespond'),
(100, 'Can view Donation Respond', 25, 'view_donationrespond'),
(101, 'Can add Donation Progress', 26, 'add_donationprogress'),
(102, 'Can change Donation Progress', 26, 'change_donationprogress'),
(103, 'Can delete Donation Progress', 26, 'delete_donationprogress'),
(104, 'Can view Donation Progress', 26, 'view_donationprogress'),
(105, 'Can add Plan', 27, 'add_plan'),
(106, 'Can change Plan', 27, 'change_plan'),
(107, 'Can delete Plan', 27, 'delete_plan'),
(108, 'Can view Plan', 27, 'view_plan'),
(109, 'Can add Checkout', 28, 'add_checkout'),
(110, 'Can change Checkout', 28, 'change_checkout'),
(111, 'Can delete Checkout', 28, 'delete_checkout'),
(112, 'Can view Checkout', 28, 'view_checkout'),
(113, 'Can add Donation', 29, 'add_donation'),
(114, 'Can change Donation', 29, 'change_donation'),
(115, 'Can delete Donation', 29, 'delete_donation'),
(116, 'Can view Donation', 29, 'view_donation'),
(117, 'Can add DonationBank', 30, 'add_donationbank'),
(118, 'Can change DonationBank', 30, 'change_donationbank'),
(119, 'Can delete DonationBank', 30, 'delete_donationbank'),
(120, 'Can view DonationBank', 30, 'view_donationbank'),
(121, 'Can add MemberRequest', 31, 'add_memberrequest'),
(122, 'Can change MemberRequest', 31, 'change_memberrequest'),
(123, 'Can delete MemberRequest', 31, 'delete_memberrequest'),
(124, 'Can view MemberRequest', 31, 'view_memberrequest'),
(125, 'Can add Donation Progress', 32, 'add_donationprogress'),
(126, 'Can change Donation Progress', 32, 'change_donationprogress'),
(127, 'Can delete Donation Progress', 32, 'delete_donationprogress'),
(128, 'Can view Donation Progress', 32, 'view_donationprogress'),
(129, 'Can add DonationBankSetting', 33, 'add_donationbanksetting'),
(130, 'Can change DonationBankSetting', 33, 'change_donationbanksetting'),
(131, 'Can delete DonationBankSetting', 33, 'delete_donationbanksetting'),
(132, 'Can view DonationBankSetting', 33, 'view_donationbanksetting'),
(133, 'Can add BankMember', 34, 'add_bankmember'),
(134, 'Can change BankMember', 34, 'change_bankmember'),
(135, 'Can delete BankMember', 34, 'delete_bankmember'),
(136, 'Can view BankMember', 34, 'view_bankmember'),
(137, 'Can add Campaign', 35, 'add_campaign'),
(138, 'Can change Campaign', 35, 'change_campaign'),
(139, 'Can delete Campaign', 35, 'delete_campaign'),
(140, 'Can view Campaign', 35, 'view_campaign'),
(141, 'Can add Donation Request', 36, 'add_donationrequest'),
(142, 'Can change Donation Request', 36, 'change_donationrequest'),
(143, 'Can delete Donation Request', 36, 'delete_donationrequest'),
(144, 'Can view Donation Request', 36, 'view_donationrequest'),
(145, 'Can add Donation Request Progress', 37, 'add_donationrequestprogress'),
(146, 'Can change Donation Request Progress', 37, 'change_donationrequestprogress'),
(147, 'Can delete Donation Request Progress', 37, 'delete_donationrequestprogress'),
(148, 'Can view Donation Request Progress', 37, 'view_donationrequestprogress'),
(149, 'Can add Blog', 38, 'add_blog'),
(150, 'Can change Blog', 38, 'change_blog'),
(151, 'Can delete Blog', 38, 'delete_blog'),
(152, 'Can view Blog', 38, 'view_blog'),
(153, 'Can add Attachment', 39, 'add_attachment'),
(154, 'Can change Attachment', 39, 'change_attachment'),
(155, 'Can delete Attachment', 39, 'delete_attachment'),
(156, 'Can view Attachment', 39, 'view_attachment'),
(157, 'Can add Comment', 40, 'add_comment'),
(158, 'Can change Comment', 40, 'change_comment'),
(159, 'Can delete Comment', 40, 'delete_comment'),
(160, 'Can view Comment', 40, 'view_comment'),
(161, 'Can add Comment Reply', 41, 'add_commentreply'),
(162, 'Can change Comment Reply', 41, 'change_commentreply'),
(163, 'Can delete Comment Reply', 41, 'delete_commentreply'),
(164, 'Can view Comment Reply', 41, 'view_commentreply');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blog_attachment`
--

CREATE TABLE `blog_attachment` (
  `id` int(11) NOT NULL,
  `file` varchar(100) DEFAULT NULL,
  `blog_id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blog_blog`
--

CREATE TABLE `blog_blog` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(250) NOT NULL,
  `details` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tags` varchar(150) DEFAULT NULL,
  `category` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blog_comment`
--

CREATE TABLE `blog_comment` (
  `id` int(11) NOT NULL,
  `comment` longtext NOT NULL,
  `is_selected` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `commented_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blog_commentreply`
--

CREATE TABLE `blog_commentreply` (
  `id` int(11) NOT NULL,
  `reply` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `replied_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `chat_chatmessage`
--

CREATE TABLE `chat_chatmessage` (
  `id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  `is_seen` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `thread_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `chat_thread`
--

CREATE TABLE `chat_thread` (
  `id` int(11) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `first_id` int(11) NOT NULL,
  `second_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `checkout_checkout`
--

CREATE TABLE `checkout_checkout` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(8, 'account', 'emailaddress'),
(9, 'account', 'emailconfirmation'),
(16, 'accounts', 'userpermission'),
(14, 'accounts', 'userprofile'),
(15, 'accounts', 'userreport'),
(13, 'accounts', 'userstripe'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(39, 'blog', 'attachment'),
(38, 'blog', 'blog'),
(40, 'blog', 'comment'),
(41, 'blog', 'commentreply'),
(22, 'chat', 'chatmessage'),
(21, 'chat', 'thread'),
(28, 'checkout', 'checkout'),
(5, 'contenttypes', 'contenttype'),
(34, 'donationBank', 'bankmember'),
(35, 'donationBank', 'campaign'),
(29, 'donationBank', 'donation'),
(30, 'donationBank', 'donationbank'),
(33, 'donationBank', 'donationbanksetting'),
(32, 'donationBank', 'donationprogress'),
(36, 'donationBank', 'donationrequest'),
(37, 'donationBank', 'donationrequestprogress'),
(31, 'donationBank', 'memberrequest'),
(23, 'donations', 'donation'),
(26, 'donations', 'donationprogress'),
(25, 'donations', 'donationrespond'),
(24, 'donations', 'donationutil'),
(27, 'priceplan', 'plan'),
(6, 'sessions', 'session'),
(7, 'sites', 'site'),
(10, 'socialaccount', 'socialaccount'),
(11, 'socialaccount', 'socialapp'),
(12, 'socialaccount', 'socialtoken'),
(20, 'suspicious', 'suspicious'),
(19, 'utils', 'location'),
(18, 'utils', 'notification'),
(17, 'utils', 'sitepreference');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-10-23 03:25:57.893939'),
(2, 'auth', '0001_initial', '2019-10-23 03:25:57.997512'),
(3, 'account', '0001_initial', '2019-10-23 03:25:58.278926'),
(4, 'account', '0002_email_max_length', '2019-10-23 03:25:58.351211'),
(5, 'accounts', '0001_initial', '2019-10-23 03:25:58.441796'),
(6, 'accounts', '0002_remove_userprofile_is_volunteer', '2019-10-23 03:25:58.533405'),
(7, 'accounts', '0003_userprofile_name', '2019-10-23 03:25:58.629599'),
(8, 'accounts', '0004_remove_userprofile_name', '2019-10-23 03:25:58.679688'),
(9, 'accounts', '0005_userreport', '2019-10-23 03:25:58.710687'),
(10, 'accounts', '0006_auto_20191006_0242', '2019-10-23 03:25:58.798539'),
(11, 'accounts', '0007_auto_20191006_0242', '2019-10-23 03:25:58.908984'),
(12, 'accounts', '0008_userpermission', '2019-10-23 03:25:58.941913'),
(13, 'admin', '0001_initial', '2019-10-23 03:25:58.989972'),
(14, 'admin', '0002_logentry_remove_auto_add', '2019-10-23 03:25:59.071772'),
(15, 'admin', '0003_logentry_add_action_flag_choices', '2019-10-23 03:25:59.090658'),
(16, 'contenttypes', '0002_remove_content_type_name', '2019-10-23 03:25:59.167084'),
(17, 'auth', '0002_alter_permission_name_max_length', '2019-10-23 03:25:59.198213'),
(18, 'auth', '0003_alter_user_email_max_length', '2019-10-23 03:25:59.214618'),
(19, 'auth', '0004_alter_user_username_opts', '2019-10-23 03:25:59.231157'),
(20, 'auth', '0005_alter_user_last_login_null', '2019-10-23 03:25:59.263973'),
(21, 'auth', '0006_require_contenttypes_0002', '2019-10-23 03:25:59.266995'),
(22, 'auth', '0007_alter_validators_add_error_messages', '2019-10-23 03:25:59.316308'),
(23, 'auth', '0008_alter_user_username_max_length', '2019-10-23 03:25:59.360102'),
(24, 'auth', '0009_alter_user_last_name_max_length', '2019-10-23 03:25:59.415466'),
(25, 'auth', '0010_alter_group_name_max_length', '2019-10-23 03:25:59.428339'),
(26, 'auth', '0011_update_proxy_permissions', '2019-10-23 03:25:59.442805'),
(27, 'blog', '0001_initial', '2019-10-23 03:25:59.481559'),
(28, 'blog', '0002_auto_20191011_0820', '2019-10-23 03:25:59.602815'),
(29, 'blog', '0003_auto_20191011_0828', '2019-10-23 03:25:59.728839'),
(30, 'blog', '0004_auto_20191011_1101', '2019-10-23 03:25:59.766405'),
(31, 'blog', '0005_blog_tags', '2019-10-23 03:25:59.788940'),
(32, 'blog', '0006_attachment_slug', '2019-10-23 03:25:59.825632'),
(33, 'blog', '0007_auto_20191015_0753', '2019-10-23 03:25:59.858279'),
(34, 'blog', '0008_auto_20191015_1009', '2019-10-23 03:25:59.872893'),
(35, 'blog', '0009_auto_20191020_2334', '2019-10-23 03:25:59.907523'),
(36, 'blog', '0010_auto_20191020_2336', '2019-10-23 03:25:59.970577'),
(37, 'blog', '0011_auto_20191020_2342', '2019-10-23 03:25:59.983615'),
(38, 'blog', '0012_commentreply', '2019-10-23 03:26:00.011310'),
(39, 'chat', '0001_initial', '2019-10-23 03:26:00.130281'),
(40, 'priceplan', '0001_initial', '2019-10-23 03:26:00.275417'),
(41, 'checkout', '0001_initial', '2019-10-23 03:26:00.314011'),
(42, 'donationBank', '0001_initial', '2019-10-23 03:26:00.607099'),
(43, 'donationBank', '0002_campaign', '2019-10-23 03:26:01.003502'),
(44, 'donationBank', '0003_auto_20190823_0202', '2019-10-23 03:26:01.049597'),
(45, 'donationBank', '0004_campaign_image', '2019-10-23 03:26:01.070259'),
(46, 'donationBank', '0005_auto_20190823_0337', '2019-10-23 03:26:01.109721'),
(47, 'donationBank', '0006_donation_data_source', '2019-10-23 03:26:01.137765'),
(48, 'donationBank', '0007_remove_donation_data_source', '2019-10-23 03:26:01.214810'),
(49, 'donationBank', '0008_remove_campaign_volunteer_request', '2019-10-23 03:26:01.257460'),
(50, 'donationBank', '0009_donationbanksetting_privacy', '2019-10-23 03:26:01.289540'),
(51, 'donationBank', '0010_donationbank_is_verified', '2019-10-23 03:26:01.307662'),
(52, 'donationBank', '0011_auto_20190922_1704', '2019-10-23 03:26:01.339891'),
(53, 'donationBank', '0012_auto_20190922_1707', '2019-10-23 03:26:01.355726'),
(54, 'donationBank', '0013_auto_20190922_1725', '2019-10-23 03:26:01.368162'),
(55, 'donationBank', '0014_auto_20190922_1727', '2019-10-23 03:26:01.382108'),
(56, 'donationBank', '0015_auto_20190922_1732', '2019-10-23 03:26:01.393915'),
(57, 'donationBank', '0016_auto_20190922_1749', '2019-10-23 03:26:01.408238'),
(58, 'donationBank', '0017_donationrequest', '2019-10-23 03:26:01.453677'),
(59, 'donationBank', '0018_auto_20190922_2004', '2019-10-23 03:26:01.524672'),
(60, 'donationBank', '0019_remove_donationrequest_blood_bag', '2019-10-23 03:26:01.562858'),
(61, 'donationBank', '0020_auto_20190922_2127', '2019-10-23 03:26:01.578540'),
(62, 'donationBank', '0021_auto_20190922_2142', '2019-10-23 03:26:01.627574'),
(63, 'donationBank', '0022_auto_20190922_2152', '2019-10-23 03:26:01.710601'),
(64, 'donationBank', '0023_auto_20190922_2200', '2019-10-23 03:26:01.789027'),
(65, 'donationBank', '0024_auto_20190924_0343', '2019-10-23 03:26:01.865593'),
(66, 'donationBank', '0025_donationrequestprogress', '2019-10-23 03:26:01.906422'),
(67, 'donations', '0001_initial', '2019-10-23 03:26:02.060234'),
(68, 'donations', '0002_auto_20190826_1321', '2019-10-23 03:26:02.290499'),
(69, 'donations', '0003_auto_20190827_0041', '2019-10-23 03:26:02.309990'),
(70, 'donations', '0004_auto_20190827_0125', '2019-10-23 03:26:02.355493'),
(71, 'donations', '0005_auto_20190902_1817', '2019-10-23 03:26:02.369950'),
(72, 'donations', '0006_auto_20190925_2126', '2019-10-23 03:26:02.418609'),
(73, 'donations', '0007_auto_20190925_2132', '2019-10-23 03:26:02.476642'),
(74, 'donations', '0008_auto_20190930_0132', '2019-10-23 03:26:02.559105'),
(75, 'donations', '0009_auto_20190930_0132', '2019-10-23 03:26:02.749647'),
(76, 'donations', '0010_donationprogress_is_pending', '2019-10-23 03:26:02.794249'),
(77, 'donations', '0011_auto_20191005_0329', '2019-10-23 03:26:02.825297'),
(78, 'donations', '0012_auto_20191005_0330', '2019-10-23 03:26:02.849382'),
(79, 'donations', '0013_donationrespond_is_applied_for_selection', '2019-10-23 03:26:02.868428'),
(80, 'donations', '0014_auto_20191005_0419', '2019-10-23 03:26:02.884988'),
(81, 'donations', '0015_remove_donationprogress_is_pending', '2019-10-23 03:26:02.923121'),
(82, 'sessions', '0001_initial', '2019-10-23 03:26:02.948352'),
(83, 'sites', '0001_initial', '2019-10-23 03:26:02.981502'),
(84, 'sites', '0002_alter_domain_unique', '2019-10-23 03:26:02.995594'),
(85, 'socialaccount', '0001_initial', '2019-10-23 03:26:03.147117'),
(86, 'socialaccount', '0002_token_max_lengths', '2019-10-23 03:26:03.353975'),
(87, 'socialaccount', '0003_extra_data_default_dict', '2019-10-23 03:26:03.366114'),
(88, 'suspicious', '0001_initial', '2019-10-23 03:26:03.392843'),
(89, 'utils', '0001_initial', '2019-10-23 03:26:03.529253');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_site`
--

CREATE TABLE `django_site` (
  `id` int(11) NOT NULL,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- Table structure for table `donationBank_bankmember`
--

CREATE TABLE `donationBank_bankmember` (
  `id` int(11) NOT NULL,
  `role` smallint(5) UNSIGNED NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `donationBank_campaign`
--

CREATE TABLE `donationBank_campaign` (
  `id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `held_date` datetime(6) NOT NULL,
  `end_date` datetime(6) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(2) NOT NULL,
  `details` longtext DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `donationBank_donation`
--

CREATE TABLE `donationBank_donation` (
  `id` int(11) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `blood_group` varchar(10) NOT NULL,
  `diseases` varchar(250) DEFAULT NULL,
  `contact` varchar(20) NOT NULL,
  `address` varchar(250) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(2) NOT NULL,
  `donation_type` smallint(5) UNSIGNED NOT NULL,
  `organ_name` varchar(100) DEFAULT NULL,
  `tissue_name` varchar(100) DEFAULT NULL,
  `quantity` int(10) UNSIGNED DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `collection_date` date NOT NULL,
  `expiration_date` date NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `bank_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `donationBank_donationbank`
--

CREATE TABLE `donationBank_donationbank` (
  `id` int(11) NOT NULL,
  `institute` varchar(100) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `address` varchar(250) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(2) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `services` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `donationBank_donationbanksetting`
--

CREATE TABLE `donationBank_donationbanksetting` (
  `id` int(11) NOT NULL,
  `member_request` smallint(5) UNSIGNED NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `privacy` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `donationBank_donationprogress`
--

CREATE TABLE `donationBank_donationprogress` (
  `id` int(11) NOT NULL,
  `progress_status` smallint(5) UNSIGNED NOT NULL,
  `completion_date` date DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `blood_group` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(2) DEFAULT NULL,
  `details` longtext DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `donation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `donationBank_donationrequest`
--

CREATE TABLE `donationBank_donationrequest` (
  `id` int(11) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `donation_type` smallint(5) UNSIGNED NOT NULL,
  `blood_group` varchar(20) DEFAULT NULL,
  `organ_name` varchar(100) DEFAULT NULL,
  `tissue_name` varchar(100) DEFAULT NULL,
  `quantity` varchar(3) NOT NULL,
  `details` longtext DEFAULT NULL,
  `publication_status` smallint(5) UNSIGNED NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `bank_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `donationBank_donationrequestprogress`
--

CREATE TABLE `donationBank_donationrequestprogress` (
  `id` int(11) NOT NULL,
  `progress_status` smallint(5) UNSIGNED NOT NULL,
  `completion_date` date DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `blood_group` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(2) DEFAULT NULL,
  `details` longtext DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `donation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `donationBank_memberrequest`
--

CREATE TABLE `donationBank_memberrequest` (
  `id` int(11) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `donations_donation`
--

CREATE TABLE `donations_donation` (
  `id` int(11) NOT NULL,
  `title` varchar(60) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `category` smallint(5) UNSIGNED NOT NULL,
  `type` smallint(5) UNSIGNED NOT NULL,
  `blood_group` varchar(20) DEFAULT NULL,
  `blood_bag` varchar(4) DEFAULT NULL,
  `organ_name` varchar(100) DEFAULT NULL,
  `tissue_name` varchar(100) DEFAULT NULL,
  `quantity` varchar(4) DEFAULT NULL,
  `donate_type` smallint(5) UNSIGNED NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `details` longtext DEFAULT NULL,
  `contact` varchar(17) NOT NULL,
  `contact2` varchar(17) DEFAULT NULL,
  `contact3` varchar(17) DEFAULT NULL,
  `contact_privacy` smallint(5) UNSIGNED NOT NULL,
  `location` varchar(200) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(2) NOT NULL,
  `hospital` varchar(200) DEFAULT NULL,
  `preferred_date` datetime(6) DEFAULT NULL,
  `preferred_date_from` datetime(6) DEFAULT NULL,
  `preferred_date_to` datetime(6) DEFAULT NULL,
  `priority` smallint(5) UNSIGNED NOT NULL,
  `publication_status` smallint(5) UNSIGNED NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `donations_donationprogress`
--

CREATE TABLE `donations_donationprogress` (
  `id` int(11) NOT NULL,
  `progress_status` smallint(5) UNSIGNED NOT NULL,
  `completion_date` date DEFAULT NULL,
  `management_status` smallint(5) UNSIGNED DEFAULT NULL,
  `details` longtext DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `donation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `donations_donationprogress_respondent`
--

CREATE TABLE `donations_donationprogress_respondent` (
  `id` int(11) NOT NULL,
  `donationprogress_id` int(11) NOT NULL,
  `donationrespond_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `donations_donationrespond`
--

CREATE TABLE `donations_donationrespond` (
  `id` int(11) NOT NULL,
  `contact` varchar(17) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `is_selected` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `donation_id` int(11) NOT NULL,
  `respondent_id` int(11) NOT NULL,
  `is_applied_for_selection` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `donations_donationutil`
--

CREATE TABLE `donations_donationutil` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `donation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `priceplan_plan`
--

CREATE TABLE `priceplan_plan` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `currency` varchar(50) NOT NULL,
  `expiration_cycle` smallint(5) UNSIGNED NOT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialaccount`
--

CREATE TABLE `socialaccount_socialaccount` (
  `id` int(11) NOT NULL,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialapp`
--

CREATE TABLE `socialaccount_socialapp` (
  `id` int(11) NOT NULL,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialapp_sites`
--

CREATE TABLE `socialaccount_socialapp_sites` (
  `id` int(11) NOT NULL,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialtoken`
--

CREATE TABLE `socialaccount_socialtoken` (
  `id` int(11) NOT NULL,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `suspicious_suspicious`
--

CREATE TABLE `suspicious_suspicious` (
  `id` int(11) NOT NULL,
  `attempt` smallint(5) UNSIGNED NOT NULL,
  `first_attempt` datetime(6) NOT NULL,
  `last_attempt` datetime(6) NOT NULL,
  `ip` varchar(150) DEFAULT NULL,
  `mac` varchar(150) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `utils_location`
--

CREATE TABLE `utils_location` (
  `id` int(11) NOT NULL,
  `location_type` smallint(5) UNSIGNED NOT NULL,
  `location` longtext DEFAULT NULL,
  `hit` int(10) UNSIGNED NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `provider_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `utils_notification`
--

CREATE TABLE `utils_notification` (
  `id` int(11) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `is_seen` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `utils_sitepreference`
--

CREATE TABLE `utils_sitepreference` (
  `id` int(11) NOT NULL,
  `logo_header_color` varchar(100) DEFAULT NULL,
  `navbar_header_color` varchar(100) DEFAULT NULL,
  `sidebar_color` varchar(50) DEFAULT NULL,
  `background_color` varchar(50) DEFAULT NULL,
  `sidebar_type` varchar(50) DEFAULT NULL,
  `scroll_to_top` tinyint(1) NOT NULL,
  `chat_with_others` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_userpermission`
--
ALTER TABLE `accounts_userpermission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `accounts_userprofile`
--
ALTER TABLE `accounts_userprofile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `accounts_userreport`
--
ALTER TABLE `accounts_userreport`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `accounts_userreport_user_id_50b9e803_fk_auth_user_id` (`user_id`),
  ADD KEY `accounts_userreport_reported_by_id_54e5f272_fk_auth_user_id` (`reported_by_id`);

--
-- Indexes for table `accounts_userstripe`
--
ALTER TABLE `accounts_userstripe`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `account_emailaddress_user_id_2c513194_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `blog_attachment`
--
ALTER TABLE `blog_attachment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `blog_attachment_blog_id_546c562f_fk_blog_blog_id` (`blog_id`);

--
-- Indexes for table `blog_blog`
--
ALTER TABLE `blog_blog`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `blog_blog_user_id_0e1a17e5_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `blog_comment`
--
ALTER TABLE `blog_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_comment_blog_id_c664fb0d_fk_blog_blog_id` (`blog_id`),
  ADD KEY `blog_comment_commented_by_id_de266e09_fk_auth_user_id` (`commented_by_id`);

--
-- Indexes for table `blog_commentreply`
--
ALTER TABLE `blog_commentreply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_commentreply_comment_id_8077b4d1_fk_blog_comment_id` (`comment_id`),
  ADD KEY `blog_commentreply_replied_by_id_ed682192_fk_auth_user_id` (`replied_by_id`);

--
-- Indexes for table `chat_chatmessage`
--
ALTER TABLE `chat_chatmessage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_chatmessage_thread_id_0986d8f2_fk_chat_thread_id` (`thread_id`),
  ADD KEY `chat_chatmessage_user_id_fa615e65_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `chat_thread`
--
ALTER TABLE `chat_thread`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_thread_first_id_f059d541_fk_auth_user_id` (`first_id`),
  ADD KEY `chat_thread_second_id_fb0dac48_fk_auth_user_id` (`second_id`);

--
-- Indexes for table `checkout_checkout`
--
ALTER TABLE `checkout_checkout`
  ADD PRIMARY KEY (`id`),
  ADD KEY `checkout_checkout_plan_id_bdbd282f_fk_priceplan_plan_id` (`plan_id`),
  ADD KEY `checkout_checkout_user_id_8b2fe298_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `django_site`
--
ALTER TABLE `django_site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`);

--
-- Indexes for table `donationBank_bankmember`
--
ALTER TABLE `donationBank_bankmember`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `donationBank_bankmem_bank_id_2bcdc1f8_fk_donationB` (`bank_id`);

--
-- Indexes for table `donationBank_campaign`
--
ALTER TABLE `donationBank_campaign`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `donationBank_campaig_bank_id_34821d75_fk_donationB` (`bank_id`);

--
-- Indexes for table `donationBank_donation`
--
ALTER TABLE `donationBank_donation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `donationBank_donatio_bank_id_d405cf8f_fk_donationB` (`bank_id`);

--
-- Indexes for table `donationBank_donationbank`
--
ALTER TABLE `donationBank_donationbank`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `donationBank_donationbanksetting`
--
ALTER TABLE `donationBank_donationbanksetting`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bank_id` (`bank_id`);

--
-- Indexes for table `donationBank_donationprogress`
--
ALTER TABLE `donationBank_donationprogress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `donation_id` (`donation_id`);

--
-- Indexes for table `donationBank_donationrequest`
--
ALTER TABLE `donationBank_donationrequest`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `donationBank_donatio_bank_id_427dc2a1_fk_donationB` (`bank_id`);

--
-- Indexes for table `donationBank_donationrequestprogress`
--
ALTER TABLE `donationBank_donationrequestprogress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `donation_id` (`donation_id`);

--
-- Indexes for table `donationBank_memberrequest`
--
ALTER TABLE `donationBank_memberrequest`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `donationBank_memberr_bank_id_0e1e58b7_fk_donationB` (`bank_id`);

--
-- Indexes for table `donations_donation`
--
ALTER TABLE `donations_donation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `donations_donation_user_id_04dd09bd_fk_accounts_userprofile_id` (`user_id`);

--
-- Indexes for table `donations_donationprogress`
--
ALTER TABLE `donations_donationprogress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `donation_id` (`donation_id`);

--
-- Indexes for table `donations_donationprogress_respondent`
--
ALTER TABLE `donations_donationprogress_respondent`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `donations_donationprogre_donationprogress_id_dona_7e44ef4e_uniq` (`donationprogress_id`,`donationrespond_id`),
  ADD KEY `donations_donationpr_donationrespond_id_ea98e9d4_fk_donations` (`donationrespond_id`);

--
-- Indexes for table `donations_donationrespond`
--
ALTER TABLE `donations_donationrespond`
  ADD PRIMARY KEY (`id`),
  ADD KEY `donations_donationre_donation_id_24e3ab44_fk_donations` (`donation_id`),
  ADD KEY `donations_donationrespond_respondent_id_a796e763_fk_auth_user_id` (`respondent_id`);

--
-- Indexes for table `donations_donationutil`
--
ALTER TABLE `donations_donationutil`
  ADD PRIMARY KEY (`id`),
  ADD KEY `donations_donationut_donation_id_1516705f_fk_donations` (`donation_id`),
  ADD KEY `donations_donationutil_user_id_c1978228_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `priceplan_plan`
--
ALTER TABLE `priceplan_plan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  ADD KEY `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `socialaccount_socialapp`
--
ALTER TABLE `socialaccount_socialapp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socialaccount_socialapp_sites`
--
ALTER TABLE `socialaccount_socialapp_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  ADD KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`);

--
-- Indexes for table `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  ADD KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`);

--
-- Indexes for table `suspicious_suspicious`
--
ALTER TABLE `suspicious_suspicious`
  ADD PRIMARY KEY (`id`),
  ADD KEY `suspicious_suspicious_user_id_ae1559a7_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `utils_location`
--
ALTER TABLE `utils_location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `utils_location_provider_id_c483f884_fk_auth_user_id` (`provider_id`);

--
-- Indexes for table `utils_notification`
--
ALTER TABLE `utils_notification`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `utils_notification_receiver_id_b9fc3e83_fk_auth_user_id` (`receiver_id`),
  ADD KEY `utils_notification_sender_id_843b75aa_fk_auth_user_id` (`sender_id`);

--
-- Indexes for table `utils_sitepreference`
--
ALTER TABLE `utils_sitepreference`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_userpermission`
--
ALTER TABLE `accounts_userpermission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_userprofile`
--
ALTER TABLE `accounts_userprofile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_userreport`
--
ALTER TABLE `accounts_userreport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_userstripe`
--
ALTER TABLE `accounts_userstripe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_attachment`
--
ALTER TABLE `blog_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_blog`
--
ALTER TABLE `blog_blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_comment`
--
ALTER TABLE `blog_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_commentreply`
--
ALTER TABLE `blog_commentreply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_chatmessage`
--
ALTER TABLE `chat_chatmessage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_thread`
--
ALTER TABLE `chat_thread`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `checkout_checkout`
--
ALTER TABLE `checkout_checkout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `django_site`
--
ALTER TABLE `django_site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `donationBank_bankmember`
--
ALTER TABLE `donationBank_bankmember`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donationBank_campaign`
--
ALTER TABLE `donationBank_campaign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donationBank_donation`
--
ALTER TABLE `donationBank_donation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donationBank_donationbank`
--
ALTER TABLE `donationBank_donationbank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donationBank_donationbanksetting`
--
ALTER TABLE `donationBank_donationbanksetting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donationBank_donationprogress`
--
ALTER TABLE `donationBank_donationprogress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donationBank_donationrequest`
--
ALTER TABLE `donationBank_donationrequest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donationBank_donationrequestprogress`
--
ALTER TABLE `donationBank_donationrequestprogress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donationBank_memberrequest`
--
ALTER TABLE `donationBank_memberrequest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donations_donation`
--
ALTER TABLE `donations_donation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donations_donationprogress`
--
ALTER TABLE `donations_donationprogress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donations_donationprogress_respondent`
--
ALTER TABLE `donations_donationprogress_respondent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donations_donationrespond`
--
ALTER TABLE `donations_donationrespond`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donations_donationutil`
--
ALTER TABLE `donations_donationutil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `priceplan_plan`
--
ALTER TABLE `priceplan_plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `socialaccount_socialapp`
--
ALTER TABLE `socialaccount_socialapp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `socialaccount_socialapp_sites`
--
ALTER TABLE `socialaccount_socialapp_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suspicious_suspicious`
--
ALTER TABLE `suspicious_suspicious`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `utils_location`
--
ALTER TABLE `utils_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `utils_notification`
--
ALTER TABLE `utils_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `utils_sitepreference`
--
ALTER TABLE `utils_sitepreference`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts_userpermission`
--
ALTER TABLE `accounts_userpermission`
  ADD CONSTRAINT `accounts_userpermission_user_id_43f5fc10_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `accounts_userprofile`
--
ALTER TABLE `accounts_userprofile`
  ADD CONSTRAINT `accounts_userprofile_user_id_92240672_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `accounts_userreport`
--
ALTER TABLE `accounts_userreport`
  ADD CONSTRAINT `accounts_userreport_reported_by_id_54e5f272_fk_auth_user_id` FOREIGN KEY (`reported_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `accounts_userreport_user_id_50b9e803_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `accounts_userstripe`
--
ALTER TABLE `accounts_userstripe`
  ADD CONSTRAINT `accounts_userstripe_user_id_764f65f5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `blog_attachment`
--
ALTER TABLE `blog_attachment`
  ADD CONSTRAINT `blog_attachment_blog_id_546c562f_fk_blog_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `blog_blog` (`id`);

--
-- Constraints for table `blog_blog`
--
ALTER TABLE `blog_blog`
  ADD CONSTRAINT `blog_blog_user_id_0e1a17e5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `blog_comment`
--
ALTER TABLE `blog_comment`
  ADD CONSTRAINT `blog_comment_blog_id_c664fb0d_fk_blog_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `blog_blog` (`id`),
  ADD CONSTRAINT `blog_comment_commented_by_id_de266e09_fk_auth_user_id` FOREIGN KEY (`commented_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `blog_commentreply`
--
ALTER TABLE `blog_commentreply`
  ADD CONSTRAINT `blog_commentreply_comment_id_8077b4d1_fk_blog_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `blog_comment` (`id`),
  ADD CONSTRAINT `blog_commentreply_replied_by_id_ed682192_fk_auth_user_id` FOREIGN KEY (`replied_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `chat_chatmessage`
--
ALTER TABLE `chat_chatmessage`
  ADD CONSTRAINT `chat_chatmessage_thread_id_0986d8f2_fk_chat_thread_id` FOREIGN KEY (`thread_id`) REFERENCES `chat_thread` (`id`),
  ADD CONSTRAINT `chat_chatmessage_user_id_fa615e65_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `chat_thread`
--
ALTER TABLE `chat_thread`
  ADD CONSTRAINT `chat_thread_first_id_f059d541_fk_auth_user_id` FOREIGN KEY (`first_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `chat_thread_second_id_fb0dac48_fk_auth_user_id` FOREIGN KEY (`second_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `checkout_checkout`
--
ALTER TABLE `checkout_checkout`
  ADD CONSTRAINT `checkout_checkout_plan_id_bdbd282f_fk_priceplan_plan_id` FOREIGN KEY (`plan_id`) REFERENCES `priceplan_plan` (`id`),
  ADD CONSTRAINT `checkout_checkout_user_id_8b2fe298_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `donationBank_bankmember`
--
ALTER TABLE `donationBank_bankmember`
  ADD CONSTRAINT `donationBank_bankmem_bank_id_2bcdc1f8_fk_donationB` FOREIGN KEY (`bank_id`) REFERENCES `donationBank_donationbank` (`id`),
  ADD CONSTRAINT `donationBank_bankmember_user_id_0995e2b4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `donationBank_campaign`
--
ALTER TABLE `donationBank_campaign`
  ADD CONSTRAINT `donationBank_campaig_bank_id_34821d75_fk_donationB` FOREIGN KEY (`bank_id`) REFERENCES `donationBank_donationbank` (`id`);

--
-- Constraints for table `donationBank_donation`
--
ALTER TABLE `donationBank_donation`
  ADD CONSTRAINT `donationBank_donatio_bank_id_d405cf8f_fk_donationB` FOREIGN KEY (`bank_id`) REFERENCES `donationBank_donationbank` (`id`);

--
-- Constraints for table `donationBank_donationbanksetting`
--
ALTER TABLE `donationBank_donationbanksetting`
  ADD CONSTRAINT `donationBank_donatio_bank_id_fb85aa69_fk_donationB` FOREIGN KEY (`bank_id`) REFERENCES `donationBank_donationbank` (`id`);

--
-- Constraints for table `donationBank_donationprogress`
--
ALTER TABLE `donationBank_donationprogress`
  ADD CONSTRAINT `donationBank_donatio_donation_id_9712fa16_fk_donationB` FOREIGN KEY (`donation_id`) REFERENCES `donationBank_donation` (`id`);

--
-- Constraints for table `donationBank_donationrequest`
--
ALTER TABLE `donationBank_donationrequest`
  ADD CONSTRAINT `donationBank_donatio_bank_id_427dc2a1_fk_donationB` FOREIGN KEY (`bank_id`) REFERENCES `donationBank_donationbank` (`id`);

--
-- Constraints for table `donationBank_donationrequestprogress`
--
ALTER TABLE `donationBank_donationrequestprogress`
  ADD CONSTRAINT `donationBank_donatio_donation_id_912893de_fk_donationB` FOREIGN KEY (`donation_id`) REFERENCES `donationBank_donationrequest` (`id`);

--
-- Constraints for table `donationBank_memberrequest`
--
ALTER TABLE `donationBank_memberrequest`
  ADD CONSTRAINT `donationBank_memberr_bank_id_0e1e58b7_fk_donationB` FOREIGN KEY (`bank_id`) REFERENCES `donationBank_donationbank` (`id`),
  ADD CONSTRAINT `donationBank_memberrequest_user_id_bbb405ec_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `donations_donation`
--
ALTER TABLE `donations_donation`
  ADD CONSTRAINT `donations_donation_user_id_04dd09bd_fk_accounts_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_userprofile` (`id`);

--
-- Constraints for table `donations_donationprogress`
--
ALTER TABLE `donations_donationprogress`
  ADD CONSTRAINT `donations_donationpr_donation_id_3db192c4_fk_donations` FOREIGN KEY (`donation_id`) REFERENCES `donations_donation` (`id`);

--
-- Constraints for table `donations_donationprogress_respondent`
--
ALTER TABLE `donations_donationprogress_respondent`
  ADD CONSTRAINT `donations_donationpr_donationprogress_id_8f3f78a3_fk_donations` FOREIGN KEY (`donationprogress_id`) REFERENCES `donations_donationprogress` (`id`),
  ADD CONSTRAINT `donations_donationpr_donationrespond_id_ea98e9d4_fk_donations` FOREIGN KEY (`donationrespond_id`) REFERENCES `donations_donationrespond` (`id`);

--
-- Constraints for table `donations_donationrespond`
--
ALTER TABLE `donations_donationrespond`
  ADD CONSTRAINT `donations_donationre_donation_id_24e3ab44_fk_donations` FOREIGN KEY (`donation_id`) REFERENCES `donations_donation` (`id`),
  ADD CONSTRAINT `donations_donationrespond_respondent_id_a796e763_fk_auth_user_id` FOREIGN KEY (`respondent_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `donations_donationutil`
--
ALTER TABLE `donations_donationutil`
  ADD CONSTRAINT `donations_donationut_donation_id_1516705f_fk_donations` FOREIGN KEY (`donation_id`) REFERENCES `donations_donation` (`id`),
  ADD CONSTRAINT `donations_donationutil_user_id_c1978228_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  ADD CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `socialaccount_socialapp_sites`
--
ALTER TABLE `socialaccount_socialapp_sites`
  ADD CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  ADD CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Constraints for table `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  ADD CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  ADD CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`);

--
-- Constraints for table `suspicious_suspicious`
--
ALTER TABLE `suspicious_suspicious`
  ADD CONSTRAINT `suspicious_suspicious_user_id_ae1559a7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `utils_location`
--
ALTER TABLE `utils_location`
  ADD CONSTRAINT `utils_location_provider_id_c483f884_fk_auth_user_id` FOREIGN KEY (`provider_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `utils_notification`
--
ALTER TABLE `utils_notification`
  ADD CONSTRAINT `utils_notification_receiver_id_b9fc3e83_fk_auth_user_id` FOREIGN KEY (`receiver_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `utils_notification_sender_id_843b75aa_fk_auth_user_id` FOREIGN KEY (`sender_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `utils_sitepreference`
--
ALTER TABLE `utils_sitepreference`
  ADD CONSTRAINT `utils_sitepreference_user_id_9dbd959a_fk_accounts_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_userprofile` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
