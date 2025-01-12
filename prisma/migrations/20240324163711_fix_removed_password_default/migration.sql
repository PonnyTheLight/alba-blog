-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_User" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "email" TEXT NOT NULL,
    "username" TEXT,
    "pass" TEXT NOT NULL,
    "banned" BOOLEAN DEFAULT false,
    "img" TEXT
);
INSERT INTO "new_User" ("banned", "email", "id", "img", "pass", "username") SELECT "banned", "email", "id", "img", "pass", "username" FROM "User";
DROP TABLE "User";
ALTER TABLE "new_User" RENAME TO "User";
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
