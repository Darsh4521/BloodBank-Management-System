-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2019 at 08:02 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ddn`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(25, 'Can add user details', 7, 'add_userdetails'),
(26, 'Can change user details', 7, 'change_userdetails'),
(27, 'Can delete user details', 7, 'delete_userdetails'),
(28, 'Can view user details', 7, 'view_userdetails'),
(29, 'Can add request details', 8, 'add_requestdetails'),
(30, 'Can change request details', 8, 'change_requestdetails'),
(31, 'Can delete request details', 8, 'delete_requestdetails'),
(32, 'Can view request details', 8, 'view_requestdetails'),
(33, 'Can add blood bank details', 9, 'add_bloodbankdetails'),
(34, 'Can change blood bank details', 9, 'change_bloodbankdetails'),
(35, 'Can delete blood bank details', 9, 'delete_bloodbankdetails'),
(36, 'Can view blood bank details', 9, 'view_bloodbankdetails'),
(37, 'Can add available blood group', 10, 'add_availablebloodgroup'),
(38, 'Can change available blood group', 10, 'change_availablebloodgroup'),
(39, 'Can delete available blood group', 10, 'delete_availablebloodgroup'),
(40, 'Can view available blood group', 10, 'view_availablebloodgroup');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$120000$zSsJ4YKIi0WE$qxGeL05Lc7bLPBuFyaPkMHWhbnhBufNi27D/s6Gbm2Q=', '2019-03-17 09:45:34.820171', 1, 'BloodBank', '', '', 'helpafriend.bloodbank@gmail.com', 1, 1, '2019-03-17 09:41:37.063883');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `availablebloodgroup`
--

CREATE TABLE `availablebloodgroup` (
  `blood_id` int(11) NOT NULL,
  `blood_group` varchar(4) NOT NULL,
  `available_units` varchar(50) NOT NULL,
  `bloodbank_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `availablebloodgroup`
--

INSERT INTO `availablebloodgroup` (`blood_id`, `blood_group`, `available_units`, `bloodbank_id_id`) VALUES
(1, 'O+', '110', 1),
(2, 'A+', '100', 1),
(3, 'A-', '150', 1),
(4, 'O+', '120', 2),
(5, 'A+', '115', 2);

-- --------------------------------------------------------

--
-- Table structure for table `bloodbankdetails`
--

CREATE TABLE `bloodbankdetails` (
  `bloodbank_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `pincode` varchar(10) NOT NULL,
  `contact_no` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(15) NOT NULL,
  `iso_certified` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bloodbankdetails`
--

INSERT INTO `bloodbankdetails` (`bloodbank_id`, `name`, `city`, `state`, `country`, `pincode`, `contact_no`, `email`, `password`, `iso_certified`) VALUES
(1, 'Rotary Blood Bank', 'nadiad', 'gujarat', 'india', '387001', '9812345673', 'rotary@gmail.com', '123456', 'Yes'),
(2, 'Red Cross Society', 'vadodara', 'gujarat', 'india', '390018', '9265647710', 'redcross@gmail.com', '1234567890', 'Yes'),
(3, 'Athar Blood Bank', 'navsari', 'gujarat', 'india', '396445', '9876543221', 'atharbb@gmail.com', '1234567890', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(10, 'dbconnection', 'availablebloodgroup'),
(9, 'dbconnection', 'bloodbankdetails'),
(8, 'dbconnection', 'requestdetails'),
(7, 'dbconnection', 'userdetails'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-03-17 09:24:25.594043'),
(2, 'auth', '0001_initial', '2019-03-17 09:24:26.133691'),
(3, 'admin', '0001_initial', '2019-03-17 09:24:26.226912'),
(4, 'admin', '0002_logentry_remove_auto_add', '2019-03-17 09:24:26.242872'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2019-03-17 09:24:26.259829'),
(6, 'contenttypes', '0002_remove_content_type_name', '2019-03-17 09:24:26.346645'),
(7, 'auth', '0002_alter_permission_name_max_length', '2019-03-17 09:24:26.389214'),
(8, 'auth', '0003_alter_user_email_max_length', '2019-03-17 09:24:26.510013'),
(9, 'auth', '0004_alter_user_username_opts', '2019-03-17 09:24:26.535335'),
(10, 'auth', '0005_alter_user_last_login_null', '2019-03-17 09:24:26.560267'),
(11, 'auth', '0006_require_contenttypes_0002', '2019-03-17 09:24:26.563220'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2019-03-17 09:24:26.573197'),
(13, 'auth', '0008_alter_user_username_max_length', '2019-03-17 09:24:26.601154'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2019-03-17 09:24:26.629047'),
(15, 'dbconnection', '0001_initial', '2019-03-17 09:24:26.705279'),
(16, 'sessions', '0001_initial', '2019-03-17 09:24:26.755471'),
(17, 'dbconnection', '0002_userdetails_pincode', '2019-03-19 17:00:58.587390'),
(18, 'dbconnection', '0003_requestdetails', '2019-03-19 17:23:19.733297'),
(19, 'dbconnection', '0004_requestdetails_blood_unit', '2019-03-19 17:50:13.935323'),
(20, 'dbconnection', '0005_auto_20190405_2254', '2019-04-05 17:25:10.122653'),
(21, 'dbconnection', '0006_auto_20190406_0002', '2019-04-05 18:32:41.644918'),
(22, 'dbconnection', '0007_bloodbankdetails_pincode', '2019-04-06 08:00:23.648188');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('qwxady065fpf6q8xnq2kx9zuiqdftpcm', 'YWE1YjllMzk0ZDk1NzhhNWY3MWE4ZThiYjhkMzM3YWQwYWQ0YmQ3ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5YjMyYTU2NGE4OGEyNzg0MzQ2NjZiZjNiYzIyNTNkYTIyM2FkNTM1In0=', '0000-00-00 00:00:00.000000'),
('xnjwq4aurq3f3gybzwny4s8d7v153y2a', 'MTYyZTY3MTRjNjk1ODUzN2UzMTI4YWViOWVmOTkwYmVkN2IyNGJhMTp7ImVtYWlsIjoiZGl2eWFzaGFoLnFhQGdtYWlsLmNvbSIsIm90cCI6Ijk4Mzg3MCIsInR5cGUiOm51bGwsInVzZXJfaWQiOjcsImZuYW1lIjoiUHJhbmF2IFBhdGVsIn0=', '2019-04-21 17:49:35.746769');

-- --------------------------------------------------------

--
-- Table structure for table `requestdetails`
--

CREATE TABLE `requestdetails` (
  `request_id` int(11) NOT NULL,
  `userid_id` int(11) NOT NULL,
  `pname` varchar(50) NOT NULL,
  `blood_group` varchar(4) NOT NULL,
  `age` varchar(3) NOT NULL,
  `required_date` date NOT NULL,
  `blood_unit` varchar(4) NOT NULL,
  `mobile_no` varchar(10) NOT NULL,
  `hospital_name` varchar(40) NOT NULL,
  `location` varchar(40) NOT NULL,
  `patient_address` varchar(100) NOT NULL,
  `purpose` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `requestdetails`
--

INSERT INTO `requestdetails` (`request_id`, `userid_id`, `pname`, `blood_group`, `age`, `required_date`, `blood_unit`, `mobile_no`, `hospital_name`, `location`, `patient_address`, `purpose`) VALUES
(1, 3, 'Nihar Sodha', 'O+', '19', '1997-07-02', '500', '9876543211', 'N.D. Desai Hospital', 'College Road,Beside DD University,Nadiad', 'nadiad', 'accident'),
(2, 3, 'Divya', 'A+', '19', '2019-04-08', '500', '7383367447', 'N.D. Desai Hospital', 'College Road,Beside DD University,Nadiad', 'nadiad', 'accident'),
(3, 3, 'Divya', 'A+', '19', '2019-04-08', '500', '7383367447', 'N.D. Desai Hospital', 'College Road,Beside DD University,Nadiad', 'vadodara', 'accident'),
(4, 3, 'Divya', 'A+', '19', '2019-04-08', '500', '7383367447', 'N.D. Desai Hospital', 'College Road,Beside DD University,Nadiad', 'vadodara', 'accident'),
(5, 3, 'Divya', 'A+', '19', '2019-04-08', '500', '7383367447', 'N.D. Desai Hospital', 'College Road,Beside DD University,Nadiad', 'vadodara', 'accident'),
(6, 3, 'Divya', 'A+', '19', '2019-04-08', '500', '7383367447', 'N.D. Desai Hospital', 'College Road,Beside DD University,Nadiad', 'vadodara', 'accident'),
(7, 3, 'Divya', 'A+', '19', '2019-04-08', '500', '7383367447', 'N.D. Desai Hospital', 'College Road,Beside DD University,Nadiad', 'vadodara', 'accident'),
(8, 3, 'Divya', 'A+', '19', '2019-04-08', '500', '7383367447', 'N.D. Desai Hospital', 'College Road,Beside DD University,Nadiad', 'vadodara', 'accident'),
(9, 3, 'Divya', 'A+', '19', '2019-04-08', '500', '7383367447', 'N.D. Desai Hospital', 'College Road,Beside DD University,Nadiad', 'vadodara', 'accident'),
(10, 3, 'Divya', 'A+', '19', '2019-04-08', '500', '7383367447', 'N.D. Desai Hospital', 'College Road,Beside DD University,Nadiad', 'vadodara', 'accident'),
(11, 3, 'Divya', 'O-', '19', '2019-12-31', '500', '7383367447', 'N.D. Desai Hospital', 'College Road,Beside DD University,Nadiad', 'nadiad', 'accident'),
(12, 3, 'Divya', 'O+', '19', '2019-12-01', '500', '9876543211', 'N.D. Desai Hospital', 'College Road,Beside DD University,Nadiad', 'nadiad', 'accident'),
(13, 3, 'Divya', 'O+', '19', '2019-12-01', '500', '9876543211', 'N.D. Desai Hospital', 'College Road,Beside DD University,Nadiad', 'nadiad', 'accident'),
(14, 3, 'Divya', 'O-', '19', '2019-12-31', '500', '7383367447', 'N.D. Desai Hospital', 'College Road,Beside DD University,Nadiad', 'nadiad', 'accident'),
(15, 3, 'Divya', 'O-', '19', '2019-12-31', '500', '7383367447', 'N.D. Desai Hospital', 'College Road,Beside DD University,Nadiad', 'nadiad', 'accident'),
(16, 3, 'Divya', 'A+', '19', '2019-12-31', '500', '7383367447', 'N.D. Desai Hospital', 'College Road,Beside DD University,Nadiad', 'nadiad', 'accident'),
(17, 3, 'Divya', 'A+', '19', '2019-12-31', '500', '7383367447', 'N.D. Desai Hospital', 'College Road,Beside DD University,Nadiad', 'vadodara', 'accident'),
(18, 7, 'Pranav Patel', 'A-', '19', '2019-04-08', '100', '9726311511', 'N.D. Desai Hospital', 'College Road,Beside DD University,Nadiad', 'navsari', 'accident'),
(19, 7, 'Pranav Patel', 'A-', '19', '2019-04-08', '100', '9726311511', 'N.D. Desai Hospital', 'College Road,Beside DD University,Nadiad', 'navsari', 'accident'),
(20, 7, 'Pranav Patel', 'A-', '19', '2019-04-08', '100', '9726311511', 'N.D. Desai Hospital', 'College Road,Beside DD University,Nadiad', 'navsari', 'accident');

-- --------------------------------------------------------

--
-- Table structure for table `userdetails`
--

CREATE TABLE `userdetails` (
  `userid` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `blood_group` varchar(4) NOT NULL,
  `dob` date NOT NULL,
  `mobile_no` varchar(10) NOT NULL,
  `country` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `pincode` varchar(6) NOT NULL,
  `email` varchar(80) NOT NULL,
  `password` varchar(15) NOT NULL,
  `availability` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userdetails`
--

INSERT INTO `userdetails` (`userid`, `fname`, `blood_group`, `dob`, `mobile_no`, `country`, `state`, `city`, `pincode`, `email`, `password`, `availability`) VALUES
(3, 'Divya Shah', 'A+', '1999-08-03', '7383367447', 'india', 'gujarat', 'vadodara', '390019', 'divyashah.qa@gmail.com', '1234567890', 'available'),
(4, 'Darsh Shah', 'A-', '1999-09-25', '9714174778', 'india', 'gujarat', 'navsari', '396445', 'darsh4521@gmail.com', '12345678', 'available'),
(5, 'Yug Rajani', 'O+', '1999-10-13', '9726311511', 'india', 'gujarat', 'navsari', '396445', 'yug.rajani@gmail.com', 'yugrajani', 'available'),
(6, 'Nihar Sodha', 'A+', '1999-09-17', '7202016399', 'india', 'gujarat', 'vadodara', '390025', 'niharsodha17@gmail.com', '1234567890', 'available'),
(7, 'Pranav Patel', 'A-', '1999-12-30', '9876453211', 'india', 'gujarat', 'navsari', '396445', 'pranavpatel3012@yahoo.com', '1234567890', 'available');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `availablebloodgroup`
--
ALTER TABLE `availablebloodgroup`
  ADD PRIMARY KEY (`blood_id`),
  ADD KEY `dbconnection_availab_bloodbank_id_id_3be44be8_fk_BloodBank` (`bloodbank_id_id`);

--
-- Indexes for table `bloodbankdetails`
--
ALTER TABLE `bloodbankdetails`
  ADD PRIMARY KEY (`bloodbank_id`);

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
-- Indexes for table `requestdetails`
--
ALTER TABLE `requestdetails`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `RequestDetails_userid_id_667a7d52_fk_UserDetails_userid` (`userid_id`);

--
-- Indexes for table `userdetails`
--
ALTER TABLE `userdetails`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- AUTO_INCREMENT for table `availablebloodgroup`
--
ALTER TABLE `availablebloodgroup`
  MODIFY `blood_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bloodbankdetails`
--
ALTER TABLE `bloodbankdetails`
  MODIFY `bloodbank_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `requestdetails`
--
ALTER TABLE `requestdetails`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `userdetails`
--
ALTER TABLE `userdetails`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

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
-- Constraints for table `availablebloodgroup`
--
ALTER TABLE `availablebloodgroup`
  ADD CONSTRAINT `dbconnection_availab_bloodbank_id_id_3be44be8_fk_BloodBank` FOREIGN KEY (`bloodbank_id_id`) REFERENCES `bloodbankdetails` (`bloodbank_id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `requestdetails`
--
ALTER TABLE `requestdetails`
  ADD CONSTRAINT `RequestDetails_userid_id_667a7d52_fk_UserDetails_userid` FOREIGN KEY (`userid_id`) REFERENCES `userdetails` (`userid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
