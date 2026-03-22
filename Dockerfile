FROM node:lts

ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable pnpm

WORKDIR /app

COPY package.json ./
COPY pnpm-lock.yaml ./
COPY astro.config.mjs ./
COPY package.json ./
COPY tsconfig.json ./
COPY wrangler.jsonc ./

RUN pnpm install
RUN pnpm astro add cloudflare

EXPOSE 4321

CMD ["pnpm", "run", "dev", "--host"]

