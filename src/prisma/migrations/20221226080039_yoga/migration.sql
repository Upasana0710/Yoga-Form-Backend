-- CreateTable
CREATE TABLE `User` (
    `id` VARCHAR(191) NOT NULL,
    `first_name` VARCHAR(191) NOT NULL,
    `last_name` VARCHAR(191) NOT NULL,
    `phone_no` VARCHAR(191) NULL,
    `email` VARCHAR(191) NOT NULL,
    `address` VARCHAR(191) NULL,
    `age` INTEGER NOT NULL,
    `gender` ENUM('MALE', 'FEMALE') NOT NULL,
    `height` INTEGER NULL,
    `weight` DOUBLE NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `batch_id` VARCHAR(191) NULL,
    `payment_status` BOOLEAN NOT NULL DEFAULT false,

    UNIQUE INDEX `User_phone_no_key`(`phone_no`),
    UNIQUE INDEX `User_email_key`(`email`),
    INDEX `email`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Batch` (
    `id` VARCHAR(191) NOT NULL,
    `startTime` INTEGER NOT NULL,
    `endTime` INTEGER NOT NULL,
    `price` DOUBLE NOT NULL,
    `batch_capacity_max` INTEGER NOT NULL,
    `batch_capacity_current` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Payment` (
    `id` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `expiresAt` DATETIME(3) NOT NULL,
    `isActive` BOOLEAN NOT NULL,
    `userId` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Payment_userId_key`(`userId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `User` ADD CONSTRAINT `User_batch_id_fkey` FOREIGN KEY (`batch_id`) REFERENCES `Batch`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Payment` ADD CONSTRAINT `Payment_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
