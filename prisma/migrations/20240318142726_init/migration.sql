-- CreateTable
CREATE TABLE "Comments" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "content" TEXT NOT NULL,
    "published" BOOLEAN NOT NULL DEFAULT false,
    "authorId" INTEGER NOT NULL,
    CONSTRAINT "Comments_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "User" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "email" TEXT NOT NULL,
    "name" TEXT,
    "pass" TEXT NOT NULL DEFAULT 'elpepe',
    "banned" BOOLEAN DEFAULT false
);

-- CreateTable
CREATE TABLE "Tags" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "postsId" INTEGER,
    CONSTRAINT "Tags_postsId_fkey" FOREIGN KEY ("postsId") REFERENCES "Posts" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Posts" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "tumble" TEXT,
    "sdesc" TEXT DEFAULT 'Descriptión not found.',
    "content" TEXT,
    "published" BOOLEAN NOT NULL DEFAULT false,
    "outstandingPostsId" INTEGER,
    CONSTRAINT "Posts_outstandingPostsId_fkey" FOREIGN KEY ("outstandingPostsId") REFERENCES "OutstandingPosts" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "OutstandingPosts" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "priority" INTEGER DEFAULT 0
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");
