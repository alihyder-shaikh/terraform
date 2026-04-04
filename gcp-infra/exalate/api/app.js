const express = require("express");
const axios = require("axios");

const app = express();

app.get("/", async (req, res) => {
	  const tenant = req.headers["x-tenant-id"];

	  if (!tenant) {
		      return res.status(400).json({ error: "tenant id required" });
		    }

	  try {
		      const response = await axios.get("http://backend", {
			            headers: {
					            "x-tenant-id": tenant
					          }
			          });

		      res.json({
			            tenant,
			            backend: response.data
			          });

		    } catch (err) {
			        res.status(500).json({ error: "backend unreachable" });
			      }
});

app.listen(3000, () => console.log("API running"));
