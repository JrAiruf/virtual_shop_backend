/*
  Warnings:

  - You are about to drop the column `info` on the `AppProducts` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "AppProducts_info_key";

-- AlterTable
ALTER TABLE "AppProducts" DROP COLUMN "info",
ADD COLUMN     "description" TEXT,
ADD COLUMN     "images" TEXT[],
ADD COLUMN     "size" TEXT[];
