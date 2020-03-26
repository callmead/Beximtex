-- MySQL dump 10.9
--
-- Host: localhost    Database: beximtex
-- ------------------------------------------------------
-- Server version	4.1.13a-nt

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bu`
--

DROP TABLE IF EXISTS `bu`;
CREATE TABLE `bu` (
  `BU` char(20) NOT NULL default '',
  PRIMARY KEY  (`BU`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `dept`
--

DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `Department` char(20) NOT NULL default '',
  PRIMARY KEY  (`Department`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `desg`
--

DROP TABLE IF EXISTS `desg`;
CREATE TABLE `desg` (
  `Designation` char(20) NOT NULL default '',
  PRIMARY KEY  (`Designation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
CREATE TABLE `email` (
  `TransactionID` char(20) NOT NULL default '',
  `EmpCode` char(6) default NULL,
  `Date` date default NULL,
  `Remarks` char(50) default NULL,
  `Email1` char(50) default NULL,
  `Email2` char(50) default NULL,
  `Password` char(10) default NULL,
  `DeptApp` char(5) default NULL,
  `DeptComm` char(50) default NULL,
  `DeptAppBy` char(6) default NULL,
  `ISApp` char(5) default NULL,
  `ISComm` char(50) default NULL,
  `ISAppBy` char(6) default NULL,
  `JobStatus` char(15) default NULL,
  PRIMARY KEY  (`TransactionID`),
  KEY `FK_EM_EC1` (`EmpCode`),
  CONSTRAINT `FK_EM_EC1` FOREIGN KEY (`EmpCode`) REFERENCES `employees` (`EmpCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `EmpCode` char(6) NOT NULL default '',
  `Password` char(10) default NULL,
  `Name` char(30) default NULL,
  `Designation` char(20) default NULL,
  `Department` char(20) default NULL,
  `Ext` char(5) default NULL,
  `DeptHead` char(30) default NULL,
  `HeadDesg` char(20) default NULL,
  `DOJ` date default NULL,
  `DOP` date default NULL,
  `BU` char(20) default NULL,
  `AppMBamt` int(6) default NULL,
  `UserType` char(20) default NULL,
  `Email` char(30) default NULL,
  `Remarks` char(50) default NULL,
  PRIMARY KEY  (`EmpCode`),
  KEY `FK_E_DS` (`Designation`),
  KEY `FK_E_DP` (`Department`),
  KEY `FK_E_BU` (`BU`),
  CONSTRAINT `FK_E_DS` FOREIGN KEY (`Designation`) REFERENCES `desg` (`Designation`),
  CONSTRAINT `FK_E_DP` FOREIGN KEY (`Department`) REFERENCES `dept` (`Department`),
  CONSTRAINT `FK_E_BU` FOREIGN KEY (`BU`) REFERENCES `bu` (`BU`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `hardware`
--

DROP TABLE IF EXISTS `hardware`;
CREATE TABLE `hardware` (
  `TransactionID` char(20) NOT NULL default '',
  `EmpCode` char(6) default NULL,
  `Date` date default NULL,
  `Description` char(50) default NULL,
  `Need` char(50) default NULL,
  `Spec` char(50) default NULL,
  `DeptApp` char(5) default NULL,
  `DeptComm` char(50) default NULL,
  `DeptAppBy` char(6) default NULL,
  `ISApp` char(5) default NULL,
  `ISComm` char(50) default NULL,
  `ISAppBy` char(6) default NULL,
  `JobStatus` char(15) default NULL,
  PRIMARY KEY  (`TransactionID`),
  KEY `FK_HW_EC1` (`EmpCode`),
  CONSTRAINT `FK_HW_EC1` FOREIGN KEY (`EmpCode`) REFERENCES `employees` (`EmpCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `hw_history`
--

DROP TABLE IF EXISTS `hw_history`;
CREATE TABLE `hw_history` (
  `SNo` int(10) unsigned NOT NULL auto_increment,
  `ItemCode` char(20) default NULL,
  `Date` date default NULL,
  `EmpCode` char(6) default NULL,
  PRIMARY KEY  (`SNo`),
  KEY `FK_HWH_IC` (`ItemCode`),
  CONSTRAINT `FK_HWH_IC` FOREIGN KEY (`ItemCode`) REFERENCES `hw_stock` (`ItemCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `hw_issue`
--

DROP TABLE IF EXISTS `hw_issue`;
CREATE TABLE `hw_issue` (
  `TransactionID` char(20) NOT NULL default '',
  `Date` date default NULL,
  `ItemCode` char(20) default NULL,
  `Item` char(30) default NULL,
  `IssuedTo` char(6) default NULL,
  `EmpCode` char(6) default NULL,
  `Remarks` char(50) default NULL,
  PRIMARY KEY  (`TransactionID`),
  KEY `FK_HWI_IC` (`ItemCode`),
  KEY `FK_HWI_IT` (`IssuedTo`),
  KEY `FK_HWI_EC` (`EmpCode`),
  CONSTRAINT `FK_HWI_IC` FOREIGN KEY (`ItemCode`) REFERENCES `hw_stock` (`ItemCode`),
  CONSTRAINT `FK_HWI_IT` FOREIGN KEY (`IssuedTo`) REFERENCES `employees` (`EmpCode`),
  CONSTRAINT `FK_HWI_EC` FOREIGN KEY (`EmpCode`) REFERENCES `employees` (`EmpCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `hw_pogr`
--

DROP TABLE IF EXISTS `hw_pogr`;
CREATE TABLE `hw_pogr` (
  `TransactionID` char(20) NOT NULL default '',
  `OID` char(20) default NULL,
  `Date` date default NULL,
  `SID` char(20) default NULL,
  `Item` char(30) default NULL,
  `QtyOrd` int(11) default NULL,
  `QtyRec` int(11) default NULL,
  `Price` int(11) default NULL,
  `Total` int(11) default NULL,
  `EmpCode` char(6) default NULL,
  `Status` char(15) default NULL,
  `OfferNo` char(30) default NULL,
  `OffDated` date default NULL,
  `LastDate` date default NULL,
  `DeliveryAt` char(30) default NULL,
  `Remarks` char(50) default NULL,
  PRIMARY KEY  (`TransactionID`),
  KEY `FK_HWPO_S` (`SID`),
  CONSTRAINT `FK_HWPO_S` FOREIGN KEY (`SID`) REFERENCES `suppliers` (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `hw_stock`
--

DROP TABLE IF EXISTS `hw_stock`;
CREATE TABLE `hw_stock` (
  `ItemCode` char(20) NOT NULL default '',
  `Date` date default NULL,
  `Item` char(30) default NULL,
  `Brand` char(20) default NULL,
  `Serial` char(20) default NULL,
  `Capacity` char(10) default NULL,
  `MB` char(10) default NULL,
  `Speed` char(10) default NULL,
  `CPUType` char(30) default NULL,
  `Quality` char(10) default NULL,
  `Issued` char(5) default NULL,
  `EmpCode` char(6) default NULL,
  `Warranty` char(10) default NULL,
  `Remarks` char(50) default NULL,
  PRIMARY KEY  (`ItemCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `hw_users`
--

DROP TABLE IF EXISTS `hw_users`;
CREATE TABLE `hw_users` (
  `EmpCode` char(6) default NULL,
  `Date` date default NULL,
  `BIOS_PW` char(10) default NULL,
  `BIOS_SPW` char(10) default NULL,
  `IP` char(16) default NULL,
  `Subnet` char(16) default NULL,
  `NetworkID` char(20) default NULL,
  `NTDomain` char(16) default NULL,
  `DNS` char(16) default NULL,
  `GW` char(16) default NULL,
  `OS` char(20) default NULL,
  `IE` char(5) default NULL,
  `Messenger` char(10) default NULL,
  `Email` char(50) default NULL,
  `Datatex` char(5) default NULL,
  `IFM` char(5) default NULL,
  `Remarks` char(50) default NULL,
  KEY `FK_HWU_EC` (`EmpCode`),
  CONSTRAINT `FK_HWU_EC` FOREIGN KEY (`EmpCode`) REFERENCES `employees` (`EmpCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `indents`
--

DROP TABLE IF EXISTS `indents`;
CREATE TABLE `indents` (
  `IndentNo` char(20) NOT NULL default '',
  `BU` char(20) default NULL,
  `Date` date default NULL,
  `Amount` int(11) default NULL,
  `RecFrom` char(30) default NULL,
  `RecDate` date default NULL,
  `RecBy` char(30) default NULL,
  `Balance` int(11) default NULL,
  `SubmtDate` date default NULL,
  `SubmtTo` char(30) default NULL,
  `Remarks` char(50) default NULL,
  PRIMARY KEY  (`IndentNo`),
  KEY `FK_IN_BU` (`BU`),
  CONSTRAINT `FK_IN_BU` FOREIGN KEY (`BU`) REFERENCES `bu` (`BU`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `TransactionID` char(20) NOT NULL default '',
  `Date` date default NULL,
  `RequestID` char(20) default NULL,
  `ReqFrom` char(6) default NULL,
  `EmpCode` char(6) default NULL,
  `Status` char(20) default NULL,
  `SID` char(20) default NULL,
  `Remarks` char(50) default NULL,
  PRIMARY KEY  (`TransactionID`),
  KEY `FK_J_RF` (`ReqFrom`),
  KEY `FK_J_EC` (`EmpCode`),
  CONSTRAINT `FK_J_RF` FOREIGN KEY (`ReqFrom`) REFERENCES `employees` (`EmpCode`),
  CONSTRAINT `FK_J_EC` FOREIGN KEY (`EmpCode`) REFERENCES `employees` (`EmpCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `mb_bill`
--

DROP TABLE IF EXISTS `mb_bill`;
CREATE TABLE `mb_bill` (
  `TransactionID` char(20) NOT NULL default '',
  `EC` char(6) default NULL,
  `Date` date default NULL,
  `CP` char(20) default NULL,
  `Name` char(30) default NULL,
  `MobileNo` char(10) default NULL,
  `Year` char(4) default NULL,
  `Month` char(2) default NULL,
  `Amount` int(11) default NULL,
  `Approved` int(11) default NULL,
  `Balance` int(11) default NULL,
  `EmpCode` char(6) default NULL,
  `Remarks` char(50) default NULL,
  PRIMARY KEY  (`TransactionID`),
  KEY `FK_EC1` (`EC`),
  KEY `FK_EC2` (`EmpCode`),
  CONSTRAINT `FK_EC1` FOREIGN KEY (`EC`) REFERENCES `employees` (`EmpCode`),
  CONSTRAINT `FK_EC2` FOREIGN KEY (`EmpCode`) REFERENCES `employees` (`EmpCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `mb_budget`
--

DROP TABLE IF EXISTS `mb_budget`;
CREATE TABLE `mb_budget` (
  `TransactionID` char(20) NOT NULL default '',
  `BU` char(20) default NULL,
  `Year` char(4) default NULL,
  `CCC` char(20) default NULL,
  `PhoneNo` char(10) default NULL,
  `MonthlyExp` int(11) default NULL,
  `ExpCeiling` int(11) default NULL,
  `MonthlyBudget` int(11) default NULL,
  `AnnualBudget` int(11) default NULL,
  `EmpCode` char(6) default NULL,
  `Remarks` char(50) default NULL,
  PRIMARY KEY  (`TransactionID`),
  KEY `FK_MBBT_BU` (`BU`),
  KEY `FK_MBBT_EC` (`EmpCode`),
  CONSTRAINT `FK_MBBT_BU` FOREIGN KEY (`BU`) REFERENCES `bu` (`BU`),
  CONSTRAINT `FK_MBBT_EC` FOREIGN KEY (`EmpCode`) REFERENCES `employees` (`EmpCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `mb_issue`
--

DROP TABLE IF EXISTS `mb_issue`;
CREATE TABLE `mb_issue` (
  `TransactionID` char(20) NOT NULL default '',
  `Date` date default NULL,
  `IssueType` char(10) default NULL,
  `IssueTo` char(6) default NULL,
  `SetOwner` char(10) default NULL,
  `SetID` char(20) default NULL,
  `SetName` char(20) default NULL,
  `PhoneNo` char(10) default NULL,
  `ReturnDate` date default NULL,
  `CCC` char(20) default NULL,
  `EmpCode` char(6) default NULL,
  `Remarks` char(50) default NULL,
  PRIMARY KEY  (`TransactionID`),
  KEY `FK_MBI_S` (`SetID`),
  KEY `FK_MBI_P` (`PhoneNo`),
  KEY `FK_MBI_IT` (`IssueTo`),
  KEY `FK_MBI_EC` (`EmpCode`),
  CONSTRAINT `FK_MBI_S` FOREIGN KEY (`SetID`) REFERENCES `mb_p_stock` (`SetID`),
  CONSTRAINT `FK_MBI_P` FOREIGN KEY (`PhoneNo`) REFERENCES `mb_s_stock` (`PhoneNo`),
  CONSTRAINT `FK_MBI_IT` FOREIGN KEY (`IssueTo`) REFERENCES `employees` (`EmpCode`),
  CONSTRAINT `FK_MBI_EC` FOREIGN KEY (`EmpCode`) REFERENCES `employees` (`EmpCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `mb_p_stock`
--

DROP TABLE IF EXISTS `mb_p_stock`;
CREATE TABLE `mb_p_stock` (
  `SetID` char(20) NOT NULL default '',
  `Date` date default NULL,
  `SetName` char(30) default NULL,
  `Brand` char(30) default NULL,
  `Model` char(20) default NULL,
  `SNo` char(20) default NULL,
  `Quality` char(10) default NULL,
  `Issued` char(5) default NULL,
  `Warranty` char(10) default NULL,
  `EmpCode` char(6) default NULL,
  `Remarks` char(50) default NULL,
  PRIMARY KEY  (`SetID`),
  KEY `FK_MBP_EC` (`EmpCode`),
  CONSTRAINT `FK_MBP_EC` FOREIGN KEY (`EmpCode`) REFERENCES `employees` (`EmpCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `mb_s_stock`
--

DROP TABLE IF EXISTS `mb_s_stock`;
CREATE TABLE `mb_s_stock` (
  `PhoneNo` char(10) NOT NULL default '',
  `Date` date default NULL,
  `CType` char(20) default NULL,
  `CProvider` char(20) default NULL,
  `CallType` char(10) default NULL,
  `PIN1` char(5) default NULL,
  `PIN2` char(5) default NULL,
  `PUK1` char(5) default NULL,
  `PUK2` char(5) default NULL,
  `Quality` char(10) default NULL,
  `Issued` char(5) default NULL,
  `EmpCode` char(6) default NULL,
  `AC` char(20) default NULL,
  `Remarks` char(50) default NULL,
  PRIMARY KEY  (`PhoneNo`),
  KEY `FK_MBS_EC` (`EmpCode`),
  CONSTRAINT `FK_MBS_EC` FOREIGN KEY (`EmpCode`) REFERENCES `employees` (`EmpCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `mb_tbill`
--

DROP TABLE IF EXISTS `mb_tbill`;
CREATE TABLE `mb_tbill` (
  `TransactionID` char(20) NOT NULL default '',
  `Year` char(4) default NULL,
  `Month` char(2) default NULL,
  `CCC` char(20) default NULL,
  `UserName` char(30) default NULL,
  `TelName` char(30) default NULL,
  `TelNo` char(10) default NULL,
  `Amount` int(11) default NULL,
  `Unit` char(30) default NULL,
  `Area` char(10) default NULL,
  `EmpCode` char(6) default NULL,
  `Remarks` char(50) default NULL,
  PRIMARY KEY  (`TransactionID`),
  KEY `FK_MBB_EC` (`EmpCode`),
  CONSTRAINT `FK_MBB_EC` FOREIGN KEY (`EmpCode`) REFERENCES `employees` (`EmpCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `mobile`
--

DROP TABLE IF EXISTS `mobile`;
CREATE TABLE `mobile` (
  `TransactionID` char(20) NOT NULL default '',
  `EmpCode` char(6) default NULL,
  `Date` date default NULL,
  `Q1` char(5) default NULL,
  `Q2` char(5) default NULL,
  `Q2a` char(15) default NULL,
  `Q3` char(50) default NULL,
  `Q4` char(5) default NULL,
  `Q5` char(10) default NULL,
  `Q6` char(50) default NULL,
  `Q7` char(5) default NULL,
  `Q8` char(10) default NULL,
  `Q9` char(5) default NULL,
  `Q10` char(5) default NULL,
  `Q11` char(5) default NULL,
  `Q12` char(50) default NULL,
  `Q13` char(5) default NULL,
  `Q13a` char(50) default NULL,
  `Q14` char(10) default NULL,
  `DeptApp` char(5) default NULL,
  `DeptComm` char(50) default NULL,
  `DeptAppBy` char(6) default NULL,
  `ISApp` char(5) default NULL,
  `ISComm` char(50) default NULL,
  `ISAppBy` char(6) default NULL,
  `JobStatus` char(15) default NULL,
  PRIMARY KEY  (`TransactionID`),
  KEY `FK_M_EC1` (`EmpCode`),
  CONSTRAINT `FK_M_EC1` FOREIGN KEY (`EmpCode`) REFERENCES `employees` (`EmpCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments` (
  `TransactionID` char(20) NOT NULL default '',
  `Date` date default NULL,
  `OID` char(20) default NULL,
  `SID` char(20) default NULL,
  `Amount` int(11) default NULL,
  `Status` char(15) default NULL,
  `LPD` date default NULL,
  `IndentNo` char(20) default NULL,
  `PMode` char(30) default NULL,
  `Remarks` char(50) default NULL,
  PRIMARY KEY  (`TransactionID`),
  KEY `FK_PYM_SID` (`SID`),
  CONSTRAINT `FK_PYM_SID` FOREIGN KEY (`SID`) REFERENCES `suppliers` (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `phone`
--

DROP TABLE IF EXISTS `phone`;
CREATE TABLE `phone` (
  `TransactionID` char(20) NOT NULL default '',
  `EmpCode` char(6) default NULL,
  `Date` date default NULL,
  `RequestType` char(20) default NULL,
  `Need` char(50) default NULL,
  `DeptApp` char(5) default NULL,
  `DeptComm` char(50) default NULL,
  `DeptAppBy` char(6) default NULL,
  `ISApp` char(5) default NULL,
  `ISComm` char(50) default NULL,
  `ISAppBy` char(6) default NULL,
  `Remarks` char(50) default NULL,
  `JobStatus` char(15) default NULL,
  PRIMARY KEY  (`TransactionID`),
  KEY `FK_P_EC1` (`EmpCode`),
  CONSTRAINT `FK_P_EC1` FOREIGN KEY (`EmpCode`) REFERENCES `employees` (`EmpCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `security`
--

DROP TABLE IF EXISTS `security`;
CREATE TABLE `security` (
  `SNo` int(10) unsigned NOT NULL auto_increment,
  `EmpCode` char(6) default NULL,
  `LogInTime` char(30) default NULL,
  `LogOutTime` char(30) default NULL,
  `Remarks` char(50) default NULL,
  PRIMARY KEY  (`SNo`),
  KEY `FK_S_EC` (`EmpCode`),
  CONSTRAINT `FK_S_EC` FOREIGN KEY (`EmpCode`) REFERENCES `employees` (`EmpCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `software`
--

DROP TABLE IF EXISTS `software`;
CREATE TABLE `software` (
  `TransactionID` char(20) NOT NULL default '',
  `EmpCode` char(6) default NULL,
  `Date` date default NULL,
  `RequestType` char(20) default NULL,
  `Description` char(50) default NULL,
  `DeptApp` char(5) default NULL,
  `DeptComm` char(50) default NULL,
  `DeptAppBy` char(6) default NULL,
  `ISApp` char(5) default NULL,
  `ISComm` char(50) default NULL,
  `ISAppBy` char(6) default NULL,
  `JobStatus` char(15) default NULL,
  PRIMARY KEY  (`TransactionID`),
  KEY `FK_S_EC1` (`EmpCode`),
  CONSTRAINT `FK_S_EC1` FOREIGN KEY (`EmpCode`) REFERENCES `employees` (`EmpCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE `suppliers` (
  `SID` char(20) NOT NULL default '',
  `Date` date default NULL,
  `Name` char(50) default NULL,
  `Address` char(50) default NULL,
  `Email` char(50) default NULL,
  `Phone` char(30) default NULL,
  `Fax` char(30) default NULL,
  `Mobile` char(30) default NULL,
  `ContactPerson` char(30) default NULL,
  `Remarks` char(50) default NULL,
  PRIMARY KEY  (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

