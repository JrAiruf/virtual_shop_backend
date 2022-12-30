-- CreateTable
CREATE TABLE "HomeImages" (
    "id" SERIAL NOT NULL,
    "url" TEXT NOT NULL,
    "position" INTEGER NOT NULL,
    "xAxis" INTEGER NOT NULL,
    "yAxis" INTEGER NOT NULL,

    CONSTRAINT "HomeImages_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AppProducts" (
    "productid" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "price" DECIMAL(65,30) NOT NULL,
    "description" TEXT NOT NULL,
    "images" TEXT[],
    "productSize" TEXT[],
    "cid" TEXT,

    CONSTRAINT "AppProducts_pkey" PRIMARY KEY ("productid")
);

-- CreateTable
CREATE TABLE "AppCategories" (
    "categoryid" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "iconImage" TEXT NOT NULL,

    CONSTRAINT "AppCategories_pkey" PRIMARY KEY ("categoryid")
);

-- CreateIndex
CREATE UNIQUE INDEX "HomeImages_url_key" ON "HomeImages"("url");

-- AddForeignKey
ALTER TABLE "AppProducts" ADD CONSTRAINT "AppProducts_cid_fkey" FOREIGN KEY ("cid") REFERENCES "AppCategories"("categoryid") ON DELETE SET NULL ON UPDATE CASCADE;
