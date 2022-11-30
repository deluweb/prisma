import { PrismaClient } from "@prisma/client";

export function createContext(ctx: any): Promise<Context>;

export interface Context {
  prisma: PrismaClient;
}