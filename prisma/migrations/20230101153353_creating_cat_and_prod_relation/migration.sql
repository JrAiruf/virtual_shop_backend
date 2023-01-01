/*
  Warnings:

  - Added the required column `products` to the `AppCategories` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "AppProducts" DROP CONSTRAINT "AppProducts_cid_fkey";

-- AlterTable
ALTER TABLE "AppCategories" ADD COLUMN     "products" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "CatAndProd" (
    "cp_id" TEXT NOT NULL,
    "cat_id" TEXT NOT NULL,
    "prod_id" TEXT NOT NULL,

    CONSTRAINT "CatAndProd_pkey" PRIMARY KEY ("cp_id")
);

-- AddForeignKey
ALTER TABLE "CatAndProd" ADD CONSTRAINT "CatAndProd_prod_id_fkey" FOREIGN KEY ("prod_id") REFERENCES "AppProducts"("productid") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CatAndProd" ADD CONSTRAINT "CatAndProd_cat_id_fkey" FOREIGN KEY ("cat_id") REFERENCES "AppCategories"("categoryid") ON DELETE RESTRICT ON UPDATE CASCADE;
