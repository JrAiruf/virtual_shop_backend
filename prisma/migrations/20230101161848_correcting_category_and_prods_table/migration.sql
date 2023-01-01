/*
  Warnings:

  - You are about to drop the column `products` on the `AppCategories` table. All the data in the column will be lost.
  - You are about to drop the column `cid` on the `AppProducts` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "AppCategories" DROP COLUMN "products";

-- AlterTable
ALTER TABLE "AppProducts" DROP COLUMN "cid";
