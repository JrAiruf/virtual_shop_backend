/*
  Warnings:

  - Added the required column `name` to the `AppUser` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "AppUser" ADD COLUMN     "name" TEXT NOT NULL;
