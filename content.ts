import type { PlasmoCSConfig } from "plasmo"
 
export const config: PlasmoCSConfig = {
  matches: ["https://linkedin.com/*", "https://www.linkedin.com/*"],
	run_at: "document_start"
}

window.location.href = "https://www.youtube.com/watch?v=o-YBDTqX_ZU";

console.log("RICK RUNNING");