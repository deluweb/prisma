import { PrismaClient } from "@prisma/client";
export * from ".prisma/client/index.d";

const prisma = new PrismaClient();

export const createContext = async (
	ctx: any
): Promise<{
	prisma: PrismaClient;
}> => {
	// Skip if you are not using a serverless environment
	ctx.callbackWaitsForEmptyEventLoop = false;

	return { ...ctx, prisma };
};
