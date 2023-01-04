-- CreateTable
CREATE TABLE "AppUser" (
    "user_id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "city" TEXT NOT NULL,

    CONSTRAINT "AppUser_pkey" PRIMARY KEY ("user_id")
);
