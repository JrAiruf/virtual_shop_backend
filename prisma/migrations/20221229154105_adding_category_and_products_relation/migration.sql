/*
  Warnings:

  - The primary key for the `AppProducts` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `AppProducts` table. All the data in the column will be lost.
  - The required column `prod_id` was added to the `AppProducts` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.

*/
-- AlterTable
ALTER TABLE "AppProducts" DROP CONSTRAINT "AppProducts_pkey",
DROP COLUMN "id",
ADD COLUMN     "prod_id" TEXT NOT NULL,
ADD CONSTRAINT "AppProducts_pkey" PRIMARY KEY ("prod_id");

-- CreateTable
CREATE TABLE "AppCategories" (
    "cat_id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "iconImage" TEXT NOT NULL,

    CONSTRAINT "AppCategories_pkey" PRIMARY KEY ("cat_id")
);

-- CreateTable
CREATE TABLE "AppCatProducts" (
    "id" TEXT NOT NULL,
    "p_id" TEXT NOT NULL,
    "c_id" TEXT NOT NULL,

    CONSTRAINT "AppCatProducts_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "AppCatProducts" ADD CONSTRAINT "AppCatProducts_p_id_fkey" FOREIGN KEY ("p_id") REFERENCES "AppProducts"("prod_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AppCatProducts" ADD CONSTRAINT "AppCatProducts_c_id_fkey" FOREIGN KEY ("c_id") REFERENCES "AppCategories"("cat_id") ON DELETE RESTRICT ON UPDATE CASCADE;
