import chokidar from "chokidar";

chokidar.watch(".").on("all", (event, path) => {
  console.log(event, path);
});
