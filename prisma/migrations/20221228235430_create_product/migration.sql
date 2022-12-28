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
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "price" DECIMAL(65,30) NOT NULL,
    "info" TEXT,

    CONSTRAINT "AppProducts_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "HomeImages_url_key" ON "HomeImages"("url");

-- CreateIndex
CREATE UNIQUE INDEX "AppProducts_info_key" ON "AppProducts"("info");
