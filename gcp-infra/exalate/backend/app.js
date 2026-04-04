const express = require("express");
const app = express();

app.get("/", (req, res) => {
  const tenant = req.headers["x-tenant-id"] || "unknown";

  res.json({
    message: "Helloooo22222 from backend",
    tenant: tenant
  });
});

app.listen(3000, () => console.log("Running"));
