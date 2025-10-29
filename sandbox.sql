--   ____    ____     _____   _____   ____    
--   /\  _`\ /\  _`\  /\  __`\/\  __`\/\  _`\  
--   \ \,\L\_\ \ \/\_\\ \ \/\ \ \ \/\ \ \ \L\ \
--    \/_\__ \\ \ \/_/_\ \ \ \ \ \ \ \ \ \ ,__/
--      /\ \L\ \ \ \L\ \\ \ \_\ \ \ \_\ \ \ \/ 
--      \ `\____\ \____/ \ \_____\ \_____\ \_\ 
--       \/_____/\/___/   \/_____/\/_____/\/_/ 
-- Scoop's Sandbox — SQL Schema v0.1-dev

-- Character Table
CREATE TABLE IF NOT EXISTS `characters` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `citizenid` VARCHAR(64) NOT NULL UNIQUE,
  `firstname` VARCHAR(50),
  `lastname` VARCHAR(50),
  `dob` DATE,
  `gender` VARCHAR(10),
  `phone` VARCHAR(20),
  `job` VARCHAR(50),
  `job_grade` INT DEFAULT 0,
  `cash` INT DEFAULT 0,
  `bank` INT DEFAULT 0,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Inventory Table
CREATE TABLE IF NOT EXISTS `inventory` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `owner` VARCHAR(64) NOT NULL,
  `item` VARCHAR(50) NOT NULL,
  `count` INT DEFAULT 1,
  `metadata` TEXT,
  `slot` INT DEFAULT 0,
  FOREIGN KEY (`owner`) REFERENCES `characters`(`citizenid`) ON DELETE CASCADE
);

-- Job Registry (Optional)
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` VARCHAR(50) PRIMARY KEY,
  `label` VARCHAR(50),
  `grades` INT DEFAULT 1
);

-- Dev Log Table (Optional)
CREATE TABLE IF NOT EXISTS `dev_logs` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `event` VARCHAR(255),
  `source` VARCHAR(64),
  `details` TEXT
);
