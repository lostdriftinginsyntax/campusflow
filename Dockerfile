FROM node:22-alpine
WORKDIR /app
COPY server ./server
COPY public ./public
RUN mkdir -p uploads
ENV PORT=3000
EXPOSE 3000
CMD ["node", "server/app.js"]
