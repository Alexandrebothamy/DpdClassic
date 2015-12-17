
# This is a fix for InnoDB in MySQL >= 4.1.x
# It "suspends judgement" for fkey relationships until are tables are set.
SET FOREIGN_KEY_CHECKS = 0;

-- ---------------------------------------------------------------------
-- dpdclassic_order_address
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `dpdclassic_order_address`;

CREATE TABLE `dpdclassic_order_address`
(
    `id` INTEGER NOT NULL,
    `code` VARCHAR(10) NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_dpdclassic_order_address_order_address_id`
        FOREIGN KEY (`id`)
        REFERENCES `order_address` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- dpdclassic_address
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `dpdclassic_address`;

CREATE TABLE `dpdclassic_address`
(
    `id` INTEGER NOT NULL,
    `title_id` INTEGER NOT NULL,
    `company` VARCHAR(255),
    `firstname` VARCHAR(255) NOT NULL,
    `lastname` VARCHAR(255) NOT NULL,
    `address1` VARCHAR(255) NOT NULL,
    `address2` VARCHAR(255) NOT NULL,
    `address3` VARCHAR(255) NOT NULL,
    `zipcode` VARCHAR(10) NOT NULL,
    `city` VARCHAR(255) NOT NULL,
    `country_id` INTEGER NOT NULL,
    `code` VARCHAR(10) NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `FI_dpdclassic_address_customer_title_id` (`title_id`),
    INDEX `FI_dpdclassic_address_country_id` (`country_id`),
    CONSTRAINT `fk_dpdclassic_address_customer_title_id`
        FOREIGN KEY (`title_id`)
        REFERENCES `customer_title` (`id`)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
    CONSTRAINT `fk_dpdclassic_address_country_id`
        FOREIGN KEY (`country_id`)
        REFERENCES `country` (`id`)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- dpdclassic_freeshipping
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `dpdclassic_freeshipping`;

CREATE TABLE `dpdclassic_freeshipping`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `active` TINYINT(1) NOT NULL,
    `created_at` DATETIME,
    `updated_at` DATETIME,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB;

# This restores the fkey checks, after having unset them earlier
SET FOREIGN_KEY_CHECKS = 1;