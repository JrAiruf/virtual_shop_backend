/*
  Warnings:

  - You are about to drop the column `iconImage` on the `AppCategories` table. All the data in the column will be lost.
  - Added the required column `iconimage` to the `AppCategories` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "AppCategories" DROP COLUMN "iconImage",
ADD COLUMN     "iconimage" TEXT NOT NULL;
