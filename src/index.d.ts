import { PrismaClient } from "@prisma/client";

export function createContext(ctx: any): Promise<{
	prisma: PrismaClient;
}>;
