/*
  Warnings:

  - You are about to drop the column `email` on the `Account` table. All the data in the column will be lost.
  - You are about to drop the column `provider` on the `Account` table. All the data in the column will be lost.
  - You are about to drop the column `tokenType` on the `Session` table. All the data in the column will be lost.
  - You are about to drop the column `email` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `image` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `role` on the `User` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[providerId,token]` on the table `Account` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `providerId` to the `Account` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "Account_provider_email_key";

-- DropIndex
DROP INDEX "User_websiteId_email_key";

-- AlterTable
ALTER TABLE "Account" DROP COLUMN "email",
DROP COLUMN "provider",
ADD COLUMN     "providerId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Session" DROP COLUMN "tokenType";

-- AlterTable
ALTER TABLE "User" DROP COLUMN "email",
DROP COLUMN "image",
DROP COLUMN "name",
DROP COLUMN "role",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- CreateTable
CREATE TABLE "WebsiteProvider" (
    "id" TEXT NOT NULL,
    "loginProvider" BOOLEAN NOT NULL,
    "enabled" BOOLEAN NOT NULL DEFAULT true,
    "scope" TEXT[],
    "variables" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "websiteId" TEXT NOT NULL,
    "providerId" TEXT NOT NULL,

    CONSTRAINT "WebsiteProvider_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WebsiteTheme" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "websiteId" TEXT NOT NULL,
    "themeId" TEXT NOT NULL,

    CONSTRAINT "WebsiteTheme_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WebsitePlugin" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "websiteId" TEXT NOT NULL,
    "pluginId" TEXT NOT NULL,

    CONSTRAINT "WebsitePlugin_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Provider" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Provider_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserDataRecord" (
    "id" TEXT NOT NULL,
    "key" TEXT NOT NULL,
    "value" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" TEXT NOT NULL,

    CONSTRAINT "UserDataRecord_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AccountDataRecord" (
    "id" TEXT NOT NULL,
    "key" TEXT NOT NULL,
    "value" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "accountId" TEXT NOT NULL,

    CONSTRAINT "AccountDataRecord_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Role" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "websiteId" TEXT NOT NULL,

    CONSTRAINT "Role_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Libary" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "sub" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Libary_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LibaryPlugin" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "sub" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "libaryId" TEXT NOT NULL,

    CONSTRAINT "LibaryPlugin_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LibaryPluginVersion" (
    "id" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "pluginId" TEXT NOT NULL,

    CONSTRAINT "LibaryPluginVersion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LibaryTheme" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "sub" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "libaryId" TEXT NOT NULL,

    CONSTRAINT "LibaryTheme_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LibaryThemeVersion" (
    "id" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "themeId" TEXT NOT NULL,

    CONSTRAINT "LibaryThemeVersion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LibaryDeveloper" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" TEXT NOT NULL,
    "libaryId" TEXT NOT NULL,

    CONSTRAINT "LibaryDeveloper_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LibaryPermissionVersion" (
    "id" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "libaryId" TEXT NOT NULL,

    CONSTRAINT "LibaryPermissionVersion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LibaryPermission" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "permisionVersionId" TEXT NOT NULL,

    CONSTRAINT "LibaryPermission_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_RoleToUser" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_LibaryPermissionToRole" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "WebsiteProvider_websiteId_providerId_key" ON "WebsiteProvider"("websiteId", "providerId");

-- CreateIndex
CREATE UNIQUE INDEX "WebsiteTheme_websiteId_themeId_key" ON "WebsiteTheme"("websiteId", "themeId");

-- CreateIndex
CREATE UNIQUE INDEX "WebsitePlugin_websiteId_pluginId_key" ON "WebsitePlugin"("websiteId", "pluginId");

-- CreateIndex
CREATE UNIQUE INDEX "Provider_name_key" ON "Provider"("name");

-- CreateIndex
CREATE UNIQUE INDEX "UserDataRecord_userId_key_key" ON "UserDataRecord"("userId", "key");

-- CreateIndex
CREATE UNIQUE INDEX "AccountDataRecord_accountId_key_key" ON "AccountDataRecord"("accountId", "key");

-- CreateIndex
CREATE UNIQUE INDEX "Role_websiteId_name_key" ON "Role"("websiteId", "name");

-- CreateIndex
CREATE UNIQUE INDEX "Libary_name_key" ON "Libary"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Libary_sub_key" ON "Libary"("sub");

-- CreateIndex
CREATE UNIQUE INDEX "LibaryPlugin_name_key" ON "LibaryPlugin"("name");

-- CreateIndex
CREATE UNIQUE INDEX "LibaryPlugin_sub_key" ON "LibaryPlugin"("sub");

-- CreateIndex
CREATE UNIQUE INDEX "LibaryPluginVersion_pluginId_version_key" ON "LibaryPluginVersion"("pluginId", "version");

-- CreateIndex
CREATE UNIQUE INDEX "LibaryTheme_name_key" ON "LibaryTheme"("name");

-- CreateIndex
CREATE UNIQUE INDEX "LibaryTheme_sub_key" ON "LibaryTheme"("sub");

-- CreateIndex
CREATE UNIQUE INDEX "LibaryThemeVersion_themeId_version_key" ON "LibaryThemeVersion"("themeId", "version");

-- CreateIndex
CREATE UNIQUE INDEX "LibaryDeveloper_userId_libaryId_key" ON "LibaryDeveloper"("userId", "libaryId");

-- CreateIndex
CREATE UNIQUE INDEX "LibaryPermissionVersion_libaryId_version_key" ON "LibaryPermissionVersion"("libaryId", "version");

-- CreateIndex
CREATE UNIQUE INDEX "LibaryPermission_permisionVersionId_name_key" ON "LibaryPermission"("permisionVersionId", "name");

-- CreateIndex
CREATE UNIQUE INDEX "_RoleToUser_AB_unique" ON "_RoleToUser"("A", "B");

-- CreateIndex
CREATE INDEX "_RoleToUser_B_index" ON "_RoleToUser"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_LibaryPermissionToRole_AB_unique" ON "_LibaryPermissionToRole"("A", "B");

-- CreateIndex
CREATE INDEX "_LibaryPermissionToRole_B_index" ON "_LibaryPermissionToRole"("B");

-- CreateIndex
CREATE UNIQUE INDEX "Account_providerId_token_key" ON "Account"("providerId", "token");

-- AddForeignKey
ALTER TABLE "WebsiteProvider" ADD CONSTRAINT "WebsiteProvider_websiteId_fkey" FOREIGN KEY ("websiteId") REFERENCES "Website"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WebsiteProvider" ADD CONSTRAINT "WebsiteProvider_providerId_fkey" FOREIGN KEY ("providerId") REFERENCES "Provider"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WebsiteTheme" ADD CONSTRAINT "WebsiteTheme_websiteId_fkey" FOREIGN KEY ("websiteId") REFERENCES "Website"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WebsiteTheme" ADD CONSTRAINT "WebsiteTheme_themeId_fkey" FOREIGN KEY ("themeId") REFERENCES "LibaryThemeVersion"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WebsitePlugin" ADD CONSTRAINT "WebsitePlugin_websiteId_fkey" FOREIGN KEY ("websiteId") REFERENCES "Website"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WebsitePlugin" ADD CONSTRAINT "WebsitePlugin_pluginId_fkey" FOREIGN KEY ("pluginId") REFERENCES "LibaryPluginVersion"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserDataRecord" ADD CONSTRAINT "UserDataRecord_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Account" ADD CONSTRAINT "Account_providerId_fkey" FOREIGN KEY ("providerId") REFERENCES "WebsiteProvider"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AccountDataRecord" ADD CONSTRAINT "AccountDataRecord_accountId_fkey" FOREIGN KEY ("accountId") REFERENCES "Account"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Role" ADD CONSTRAINT "Role_websiteId_fkey" FOREIGN KEY ("websiteId") REFERENCES "Website"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LibaryPlugin" ADD CONSTRAINT "LibaryPlugin_libaryId_fkey" FOREIGN KEY ("libaryId") REFERENCES "Libary"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LibaryPluginVersion" ADD CONSTRAINT "LibaryPluginVersion_pluginId_fkey" FOREIGN KEY ("pluginId") REFERENCES "LibaryPlugin"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LibaryTheme" ADD CONSTRAINT "LibaryTheme_libaryId_fkey" FOREIGN KEY ("libaryId") REFERENCES "Libary"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LibaryThemeVersion" ADD CONSTRAINT "LibaryThemeVersion_themeId_fkey" FOREIGN KEY ("themeId") REFERENCES "LibaryTheme"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LibaryDeveloper" ADD CONSTRAINT "LibaryDeveloper_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LibaryDeveloper" ADD CONSTRAINT "LibaryDeveloper_libaryId_fkey" FOREIGN KEY ("libaryId") REFERENCES "Libary"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LibaryPermissionVersion" ADD CONSTRAINT "LibaryPermissionVersion_libaryId_fkey" FOREIGN KEY ("libaryId") REFERENCES "Libary"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LibaryPermission" ADD CONSTRAINT "LibaryPermission_permisionVersionId_fkey" FOREIGN KEY ("permisionVersionId") REFERENCES "LibaryPermissionVersion"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_RoleToUser" ADD CONSTRAINT "_RoleToUser_A_fkey" FOREIGN KEY ("A") REFERENCES "Role"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_RoleToUser" ADD CONSTRAINT "_RoleToUser_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LibaryPermissionToRole" ADD CONSTRAINT "_LibaryPermissionToRole_A_fkey" FOREIGN KEY ("A") REFERENCES "LibaryPermission"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LibaryPermissionToRole" ADD CONSTRAINT "_LibaryPermissionToRole_B_fkey" FOREIGN KEY ("B") REFERENCES "Role"("id") ON DELETE CASCADE ON UPDATE CASCADE;
