/*
  Warnings:

  - You are about to drop the column `productSize` on the `AppProducts` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "AppProducts" DROP COLUMN "productSize",
ADD COLUMN     "size" TEXT[];
